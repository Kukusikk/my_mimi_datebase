--вставка в ship_declaration. проверка второго триггера--




--верная вставка
INSERT INTO ship_declaration (total_tonnage, total_price, id_port_from, id_port_where, id_customer,id_flight)
    VALUES (400,2345,2,3,3,9);
--неверная вставка
INSERT INTO ship_declaration (total_tonnage, total_price, id_port_from, id_port_where, id_customer,id_flight)
    VALUES (4000,2345,2,3,3,9);

--удаление из шипдекларейшен
delete from ship_declaration where id_declaration=...;
--проверка изменений в таблице flight
select * from flight where id_flight=9;
--проверка изменений в шипдекларейшен
select * from ship_declaration;




--вставка в ticket




--неверная вставка

--несовпадение класса каюты и желаемой каюты
select class from cabin where id_cabin=1;

INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('standart',1,1,2,2,790,1);


--проверка на то что судно на которое покупается билет не похищено пиратами и не в утиле--
select status from ship where id_ship=(select id_ship from cabin where id_cabin=10);

INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',10,1,3,5,790,1);



--проверить что на рейсе свободных мест больше 0


INSERT INTO flight VALUES
    (11,'2019-11-13', '2019-12-22', 700, 0,0,600,0);
INSERT INTO ship_for_flight VALUES
    (1,11,0, 0,0,0);
INSERT INTO port_for_flight VALUES
    (1,11);
INSERT INTO port_for_flight VALUES
    (2,11);

select quantity_empty_place from flight where id_flight=11;
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',2,1,2,11,790,1);




--свободных кабин нужного типа больше 0--


INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('Toty', 1907, 7146, 'swim', 0,0,780,'A');
INSERT INTO cabin VALUES
    (26,11,'lux',5,7000);

INSERT INTO ship_for_flight VALUES
    (11,1,0, 0,0,0);
INSERT INTO port_for_flight VALUES
    (1,1);
INSERT INTO port_for_flight VALUES
    (2,1);

select quantity_empty_place_lux from ship_for_flight where id_flight=1 and id_ship=(select id_ship from cabin where id_cabin=26);
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',26,1,2,1,790,1);

select NOT EXISTS(SELECT 1 FROM flight WHERE (id_flight=2 and quantity_empty_place>0));




INSERT INTO ship_for_flight VALUES
    (2,2,5, 0,3,0);
--так мы знаем номер кабины и нужный рейс,  проверим по билетам и пересечениям портов, если таких нет то производим вставку--
--для этого сначала закинем несмоклько правильных билетов чтобы пересечься


INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('XXXXXX', 1907, 7146, 'swim', 10,0,780,'A');
INSERT INTO cabin VALUES
    (30,110,'lux',5,7000);

INSERT INTO ship_for_flight VALUES
    (110,1,5, 5,5,5);
INSERT INTO port_for_flight VALUES
    (1,1);
INSERT INTO port_for_flight VALUES
    (2,1);






--здесь еще смотрим на предупреждение о цене
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',13,1,2,1,790,1);
--А ЗДЕСЬ ПРЕДУПРЕЖДЕНИЯ О ЦЕНЕ НЕТ
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',13,2,1,1,600,1);

--ТЕПЕРЬ вставляем билет с пересечением портов сперва в одну сторону
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',13,1,5,1,790,1);
--теперь в другую сторону
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',13,5,1,1,790,1);





--дальше вставляем какой нибудь правильный билет и проверяем что нужные поля в других таблицах меняются

select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_lux, quantity_busy_place_lux from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=2);
INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('lux',2,1,3,5,790,1);
select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_lux, quantity_busy_place_lux from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=2);



--теперь тоже самое для номера стандарт
select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_stand, quantity_busy_place_stand from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=7);

INSERT INTO ticket (class_ticket , id_cabin, id_port_from, id_port_where, id_flight, price,id_customer)
    VALUES ('standart',7,1,3,5,790,1);
select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_stand, quantity_busy_place_stand from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=7);




--теперь их же удалим
--найдем их айди и удалим по нему

 select * from ticket;
delete from ticket where id_ticket=...;
select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_stand, quantity_busy_place_stand from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=7);


delete from ticket where id_ticket=...;
select quantity_empty_place, quantity_busy_place from flight where id_flight=5;
select quantity_empty_place_lux, quantity_busy_place_lux from ship_for_flight where id_flight=5 and id_ship=(select id_ship from cabin where id_cabin=2);




