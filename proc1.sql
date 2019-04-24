DROP FUNCTION forming_flight;

--процедура формирования рейса, если номер рейса равен нулю то значит это новый порт
--и нужно его вставлять иначе проверяем его данные
--проверяем данные порта и добавляем если надо этот порт в рейс 
--вернем номер рейса и количество портов в рейсе
--CREATE TYPE my_type as(fl int, sum_port int);

CREATE OR REPLACE FUNCTION forming_flight (int,date,date,int, int,int,int,int,VARCHAR(20),VARCHAR(20), out num_fl int, out sum_port int, out our_comment varchar(20) ,out code_end int) 
AS $$
DECLARE


  num_port int;
BEGIN
        num_fl:=0;
        sum_port :=0;
        code_end:=0;
        our_comment:='Все хорошо!';

--СПЕРВА проверяем что у нас существует порт с такими координатами и именем
      IF NOT EXISTS( SELECT 1 from port where name=$9 AND coordinates=$10 ) THEN
        our_comment:='Вашего порта не существует';
        code_end:=1;
        return;
      END IF;
      num_port:=(select id_port from port where name=$9 AND coordinates=$10 );

--если номер рейса не нулевой то проверяем что данные которые про него у нас корректные
     IF ($1!=0) then
          IF NOT EXISTS( SELECT 1 from flight where id_flight=$1 AND go_out=$2 AND go_in=$3  AND length=$4   and  quantity_empty_place=$5  AND  quantity_busy_place=$6  AND  quantity_empty_cargo=$7 AND quantity_busy_cargo=$8  ) THEN
        our_comment:='Вашего рейса не существует';
        code_end:=2;
        return;
          END IF;
      num_fl:=$1;
--если номер рейса нулевой то это новый рейс и добавляем его
     ELSE 
      num_fl:=(select max(id_flight) from flight)+1;
      INSERT INTO flight (id_flight,go_out , go_in, length, quantity_empty_place, quantity_busy_place, quantity_empty_cargo,quantity_busy_cargo)
      VALUES (num_fl,$2,$3,$4,$5,$6,$7,$8);
       
     end if; 
--добавляем запись в таблицу порты_для_рейса
     INSERT INTO port_for_flight VALUES
    (num_port,num_fl);


--возвращаем номер рейса и количество портов где он останавливается

  sum_port:=(select count(*) from port_for_flight where id_flight=num_fl);
  
  
END;
$$ LANGUAGE plpgsql;



