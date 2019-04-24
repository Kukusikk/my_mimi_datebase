DROP FUNCTION statistic_ship_flight;

--процедура формирования рейса, если номер рейса равен нулю то значит это новый порт
--и нужно его вставлять иначе проверяем его данные
--проверяем данные порта и добавляем если надо этот порт в рейс 
--вернем номер рейса и количество портов в рейсе
--CREATE TYPE my_type as(fl int, sum_port int);




--для курсора:
--1. Объявить курсор.

--2. Открыть курсор для запроса.

--3. Выбрать результаты в переменные PL/SQL.

--4. Закрыть курсор.

CREATE OR REPLACE FUNCTION statistic_ship_flight (out ins_d int,out upt_d int ) 
AS $$
DECLARE
    sum_cas int;
    sum_g int;
    now_d DATE;
    rec_flight_ship  RECORD;
    curs_for_flight_ship CURSOR FOR SELECT * FROM ship_for_flight;

BEGIN
    sum_cas :=0;
    sum_g :=0;


--сперва проверяем что такая таблица существует 
--если ее не существует то создаем
--структура таблицы: рейс,судно,сумма судна и сумма груза на это число 
     CREATE TABLE IF NOT EXISTS statictic_(
        id_statist           SERIAL PRIMARY KEY,
        date_statistic       DATE NOT NULL,
        id_flight            INTEGER NOT NULL,
        id_ship              INTEGER NOT NULL,
        sum_customer         INTEGER NOT NULL,
        sum_gr               INTEGER NOT NULL
        );




--дальше с помощью курсора идем по таблице ship_for_flight и если в нашей этой таблице есть запись с таким рейсом и кораблем то прибавляем к полям сумма груза количество занятого груза,
--а к полю сумма пассажиров количество занятых стандарт+ ищем билеты люкс на этот рейс и кораблб с датой больше той что последний раз и апдейтем эти данные с сегодняшней датой
      OPEN curs_for_flight_ship;
      LOOP
 --здесь открыли цикл
--в переменной rec_flight_ship у нас текущая запись из исследуемой таблицы
          FETCH curs_for_flight_ship INTO rec_flight_ship;
          EXIT WHEN NOT FOUND;
          now_d:=CURRENT_DATE;
          sum_g:=rec_flight_ship.quantity_busy_gr;
          sum_cas:=(select count(*) from ticket where id_flight=rec_flight_ship.id_flight and    id_cabin=(select id_cabin FROM cabin WHERE id_ship=rec_flight_ship.id_ship)); --количество пассажиров=количество занятыхна данный рейс и данный корабль
          





--если записи с таким рейсом/судном нет то вставляем  с сегодняшней датой
       IF NOT EXISTS( SELECT 1 FROM statictic_ WHERE id_ship=rec_flight_ship.id_ship and id_flight=rec_flight_ship.id_flight) THEN 
              INSERT INTO statictic_ (date_statistic , id_flight, id_ship, sum_customer, sum_gr)
              VALUES (now_d ,rec_flight_ship.id_flight,rec_flight_ship.id_ship,sum_cas,sum_g);
              ins_d:=ins_d+1;


       ELSE
--а если существует то апдейтем


         UPDATE statictic_ SET (date_statistic ,sum_customer, sum_gr) = ( now_d , sum_cas, sum_gr+sum_g)
         WHERE id_flight = rec_flight_ship.id_flight AND id_ship=rec_flight_ship.id_ship;
          upt_d:=upt_d+1;



       END IF;
--закрываем цикл и закрываем курсор
      END LOOP ;
      CLOSE curs_for_flight_ship; 
END;
$$ LANGUAGE plpgsql;


