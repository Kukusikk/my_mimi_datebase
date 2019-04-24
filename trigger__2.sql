--наш второй триггер--
CREATE OR REPLACE FUNCTION ship_dec() RETURNS TRIGGER AS $$
   BEGIN
   IF (TG_OP = 'INSERT') THEN

--проверить что общий тоннаж меньше или равен своободному в рейсе--
      IF not EXISTS(SELECT 1 FROM flight where (id_flight=NEW.id_flight and quantity_empty_cargo>=NEW.total_tonnage)) then
         RAISE Exception 'нет места для нового груза';
      END IF;
--проверить что рейс останавливается в нужных портах->> не делаем данную проверку т к у нас это  является внешним ключом  --  значит в случае чего исключение вылетит еще до срабатывания триггера

--после вставки обновить значение количества своб/занят груза на рейсе
      UPDATE flight SET (quantity_empty_cargo, quantity_busy_CARGO) = (quantity_empty_cargo-NEW.total_tonnage, quantity_busy_cargo+NEW.total_tonnage)
      WHERE id_flight = NEW.id_flight;
      return NEW;

   ELSIF (TG_OP = 'DELETE') THEN

      UPDATE flight SET (quantity_empty_cargo, quantity_busy_CARGO) = (quantity_empty_cargo+OLD.total_tonnage, quantity_busy_cargo-OLD.total_tonnage)
      WHERE id_flight = OLD.id_flight;
      RETURN OLD;

   END IF;

   END;
$$ LANGUAGE plpgsql;




--drop trigger ship_declaration_ins ON ship_declaration;
CREATE TRIGGER ship_declaration_ins
    AFTER INSERT OR DELETE ON ship_declaration
    FOR EACH ROW
    EXECUTE PROCEDURE ship_dec();
