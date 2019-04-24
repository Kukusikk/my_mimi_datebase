--нужный нам корабль: select id_ship from cabin where id_cabin=NEW.id_cabin) --
drop trigger tickert_ins ON ticket;
DROP FUNCTION tic;

CREATE OR REPLACE FUNCTION tic() RETURNS TRIGGER AS $$
   BEGIN


      IF (TG_OP = 'INSERT') THEN
--проверка совпадения желаемого класса каюты и запрашиваемой каюты  ++ --
      IF NOT EXISTS( SELECT 1 from cabin where id_cabin=NEW.id_cabin AND class=NEW.class_ticket) THEN
       RAISE EXCEPTION 'Несовпадение желаемой кабины с ее классом';
      END IF;
--проверка на то что судно на которое покупается билет не похищено пиратами и не в утиле ++--
      IF NOT EXISTS( SELECT 1 FROM ship where ((id_ship=(select id_ship from cabin where id_cabin=NEW.id_cabin) and status='swim') or (id_ship=(select id_ship from cabin where id_cabin=NEW.id_cabin) and status='in port'))) THEN
       RAISE EXCEPTION 'Наше судно не может сейчас совершать рейсы';
      END IF;
--проверить что на рейсе свободных мест больше 0   ++
      IF NOT EXISTS(SELECT 1 FROM flight WHERE (id_flight=NEW.id_flight and quantity_empty_place>0)) THEN
      RAISE EXCEPTION 'Наше судно не участвуют в этом рейсе или не осталось свободных мест';
      END IF;
--проверить что наш корабль участвует в желаемом нами рейсе и свободных кабин нужного типа больше 0  ++--
      IF NOT EXISTS(SELECT 1 FROM ship_for_flight WHERE (id_ship=(select id_ship from cabin where id_cabin=NEW.id_cabin) and id_flight=NEW.id_flight and   ((quantity_empty_place_lux>0 and NEW.class_ticket='lux') or (quantity_empty_place_stand>0    and              NEW.class_ticket='standart') ))) THEN
       RAISE EXCEPTION 'не осталось свободных мест на корабле в каютах данного класса';
      END IF;




--так мы знаем номер кабины и нужный рейс,  проверим по билетам и пересечениям портов, если таких нет то производим вставку--
     IF EXISTS (SELECT 1 FROM ticket WHERE (id_cabin=NEW.id_cabin AND id_flight=new.id_flight AND    id_port_from<id_port_where and NEW.id_port_from<NEW.id_port_where and      ((id_port_from>NEW.id_port_from and id_port_from<NEW.id_port_where) or (id_port_where>NEW.id_port_from and id_port_where<NEW.id_port_where) or (id_port_from=NEW.id_port_from and     id_port_where=NEW.id_port_where) OR (NEW.id_port_from>id_port_from and NEW.id_port_from<id_port_where))))
     THEN
         RAISE EXCEPTION 'каЮТА НА ДАННЫЙ ПРОМЕЖУТОК ПУТИ ЗАНЯТА ДРУГИМИ клиентами';
     END IF;





     IF EXISTS (SELECT 1 FROM ticket WHERE (id_cabin=NEW.id_cabin AND id_flight=new.id_flight AND  id_port_from>id_port_where and NEW.id_port_from>NEW.id_port_where and  ( (id_port_from<NEW.id_port_from and id_port_from>NEW.id_port_where) or (id_port_where<NEW.id_port_from and id_port_where>NEW.id_port_where) or (id_port_from=NEW.id_port_from and id_port_where=NEW.id_port_where) OR (NEW.id_port_from<id_port_from and NEW.id_port_from>id_port_where)  ) ) )
      THEN 
       RAISE EXCEPTION 'каЮТА НА ДАННЫЙ ПРОМЕЖУТОК ПУТИ ЗАНЯТА ДРУГИМИ клиентами';
      END IF;     




--вставляем сам билет, выводя предупреждение о цене в случае несовпадения--
IF (NEW.id_port_from<NEW.id_port_where AND(NEW.id_port_where-NEW.id_port_from)*(select price_between from cabin where id_cabin=NEW.id_cabin)!=NEW.price) THEN
RAISE INFO 'Цена в билете и полученная при помощи расчета не совпадает';
end if;
IF (NEW.id_port_from>NEW.id_port_where AND ((NEW.id_port_from-NEW.id_port_where)*(select price_between from cabin where id_cabin=NEW.id_cabin)!=NEW.price)) THEN
RAISE INFO 'Цена в билете и полученная при помощи расчета не совпадает(корабль едет в обратную сторону)';
end if;



-- увеличиваем кол-во занятых мест нужного класс в рейсе ,судне на рейсе--
  UPDATE flight SET (quantity_empty_place, quantity_busy_place) = (quantity_empty_place-1, quantity_busy_place+1)
  WHERE id_flight = NEW.id_flight;

  IF (NEW.class_ticket='lux') THEN
 UPDATE ship_for_flight SET (quantity_empty_place_lux, quantity_busy_place_lux) = (quantity_empty_place_lux-1, quantity_busy_place_lux+1)
  WHERE id_flight = NEW.id_flight AND id_ship=(select id_ship from cabin where id_cabin=NEW.id_cabin);
  ELSE 
UPDATE ship_for_flight SET (quantity_empty_place_stand, quantity_busy_place_stand) = (quantity_empty_place_stand-1, quantity_busy_place_stand+1)
  WHERE id_flight = NEW.id_flight AND id_ship=(select id_ship from cabin where id_cabin=NEW.id_cabin);
  END IF;
  return NEW;





--ЕСЛИ У НАС СДАЮТ БИЛЕТ--
   ELSIF (TG_OP = 'DELETE') THEN
     UPDATE flight SET (quantity_empty_place, quantity_busy_place) = (quantity_empty_place+1, quantity_busy_place-1)  WHERE id_flight = OLD.id_flight;
IF (OLD.class_ticket='lux') THEN
 UPDATE ship_for_flight SET (quantity_empty_place_lux, quantity_busy_place_lux) = (quantity_empty_place_lux+1, quantity_busy_place_lux-1)
  WHERE id_flight = OLD.id_flight AND id_ship=(select id_ship from cabin where id_cabin=OLD.id_cabin);
  ELSE 
UPDATE ship_for_flight SET (quantity_empty_place_stand, quantity_busy_place_stand) = (quantity_empty_place_stand+1, quantity_busy_place_stand-1)
  WHERE id_flight = OLD.id_flight AND id_ship=(select id_ship from cabin where id_cabin=OLD.id_cabin);
  END IF;
     return OLD;



      



   END IF;
   END;
$$ LANGUAGE plpgsql;






CREATE TRIGGER tickert_ins
    BEFORE INSERT OR DELETE ON ticket
    FOR EACH ROW
    EXECUTE PROCEDURE tic();
