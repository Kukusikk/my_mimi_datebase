--вставка в flight--
INSERT INTO flight VALUES
    (1, '2019-07-13', '2019-07-22', 1000, 50,0,1800,0);
INSERT INTO flight VALUES
    (2, '2019-06-13', '2019-06-22', 100, 10,0,100,0);
INSERT INTO flight VALUES
    (3, '2019-08-13', '2019-08-22', 1700, 11,0,1900,0);
INSERT INTO flight VALUES
    (4, '2019-07-11', '2019-07-21', 800, 7,0,1890,0);
INSERT INTO flight VALUES
    (5, '2019-07-27', '2019-07-30', 6600, 2,0,1100,0);
INSERT INTO flight VALUES
    (6, '2019-05-13', '2019-07-22', 2300, 5,0,100,0);
INSERT INTO flight VALUES
    (7, '2019-07-01', '2019-07-22', 160, 1,0,800,0);
INSERT INTO flight VALUES
    (8, '2019-07-19', '2019-09-22', 200, 2,0,800,0);
INSERT INTO flight VALUES
    (9, '2019-04-03', '2019-07-22', 900, 3,0,900,0);
INSERT INTO flight VALUES
    (10,'2019-11-13', '2019-12-22', 700, 6,0,600,0);



--вставка в ship--

INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('Tot', 1907, 7146, 'swim', 3,4,780,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('www', 1908, 7100, 'swim', 3,5,70,'B');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('YYY', 1944, 4406, 'in port', 2,4,980,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('XXX', 1867, 6406, 'swim', 3,1,787,'C');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('ZIP', 1967, 7006, 'in port', 6,4,380,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('IOO', 1745, 7456, 'pirats', 3,4,80,'B');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('MYY', 1956, 1236, 'swim', 3,7,1780,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('CAT', 1933, 716, 'pirats', 3,4,680,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('DOG', 1902, 3206, 'swim', 6,4,380,'C');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('RRR', 1900, 4506, 'swim', 4,4,980,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('MDD', 1888, 806, 'in port', 8,4,1780,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('LOP', 1999, 106, 'swim', 44,4,2780,'C');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('STP', 2008, 6, 'swim', 2,4,786,'A');
INSERT INTO ship (name, year_both, service_price, status, quantity_place_lux,quantity_place_stand,tonnage ,rank)
    VALUES ('JJJ', 2007, 1106, 'pirats', 1,4,380,'B');


--вставка в capitain
INSERT INTO captain VALUES
    (1,7653395345, 'Ecc', 'Coo','Hum',12,23654);
INSERT INTO captain VALUES
    (2,7652222345, 'Eccaa', 'Caao','Lum',12,265634);
INSERT INTO captain VALUES
    (3,7653212333, 'Tjgcc', 'Cyyyyo','Qasum',12,21234);
INSERT INTO captain VALUES
    (4,7653212000, 'Voc', 'Aqwoo','Fjhgum',12,234809);
INSERT INTO captain VALUES
    (5,7645673456, 'Diic', 'Cggggo','Ehjuum',12,23465);
INSERT INTO captain VALUES
    (6,7653212311, 'Eccqqq', 'Choo','Hum',12,232344);
INSERT INTO captain VALUES
    (7,1113212345, 'Ecc', 'Coo','Rweum',12,230);
INSERT INTO captain VALUES
    (8,7223212345, 'Eccwrty', 'Coo','Hum',12,11234);
INSERT INTO captain VALUES
    (9,7542912345, 'Ecc', 'Coii','Hasm',12,2300004);
INSERT INTO captain VALUES
    (10,7658212345, 'Ecc', 'Poin','Sopm',12,2111134);


--вставка в ship_for_flight
INSERT INTO ship_for_flight VALUES
    (1,5,56, 0,3,0,5,6);
INSERT INTO ship_for_flight VALUES
    (4,5,6, 0,7,0,4,5);
INSERT INTO ship_for_flight VALUES
    (9,7,16, 0,3,0,33,4);
INSERT INTO ship_for_flight VALUES
    (4,8,6, 0,9,0,2,3);
INSERT INTO ship_for_flight VALUES
    (3,2,8, 0,3,0,1,2);
INSERT INTO ship_for_flight VALUES
    (7,1,4, 0,2,0,0,0);
INSERT INTO ship_for_flight VALUES
    (6,2,2, 0,5,0,5,5);
INSERT INTO ship_for_flight VALUES
    (8,8,3, 0,4,0,3,3);
INSERT INTO ship_for_flight VALUES
    (1,1,2, 0,3,0,6,6);
INSERT INTO ship_for_flight VALUES
    (10,5,1, 0,2,0,2,2);
INSERT INTO ship_for_flight VALUES
    (2,5,4, 0,3,0,1,1);
INSERT INTO ship_for_flight VALUES
    (4,2,5, 0,3,0,9,0);



--вставка в captain_for_flight 
INSERT INTO captain_for_flight VALUES
    (1,5,3);
INSERT INTO captain_for_flight VALUES
    (4,5,2);
INSERT INTO captain_for_flight VALUES
    (9,7,7);
INSERT INTO captain_for_flight VALUES
    (4,8,4);
INSERT INTO captain_for_flight VALUES
    (3,2,7);
INSERT INTO captain_for_flight VALUES
    (1,5,1);
INSERT INTO captain_for_flight VALUES
    (7,1,5);
INSERT INTO captain_for_flight VALUES
    (6,2,9);
INSERT INTO captain_for_flight VALUES
    (8,8,2);
INSERT INTO captain_for_flight VALUES
    (1,1,4);


--вставка в cabin
INSERT INTO cabin VALUES
    (1,2,'lux',3,700);
INSERT INTO cabin VALUES
    (2,1,'lux',5,600);
INSERT INTO cabin VALUES
    (3,2,'lux',3,800);
INSERT INTO cabin VALUES
    (4,2,'lux',4,900);
INSERT INTO cabin VALUES
    (5,3,'lux',3,1000);
INSERT INTO cabin VALUES
    (6,3,'lux',3,700);
INSERT INTO cabin VALUES
    (7,4,'standart',2,500);
INSERT INTO cabin VALUES
    (8,5,'standart',2,400);
INSERT INTO cabin VALUES
    (9,5,'standart',2,200);
INSERT INTO cabin VALUES
    (10,6,'lux',1,900);
INSERT INTO cabin VALUES
    (11,6,'lux',1,5500);
INSERT INTO cabin VALUES
    (12,7,'standart',3,600);
INSERT INTO cabin VALUES
    (13,7,'lux',3,700);
INSERT INTO cabin VALUES
    (14,8,'lux',3,750);
INSERT INTO cabin VALUES
    (15,8,'standart',3,700);
INSERT INTO cabin VALUES
    (16,9,'standart',2,500);
INSERT INTO cabin VALUES
    (17,9,'standart',4,2300);
INSERT INTO cabin VALUES
    (18,10,'lux',3,70);
INSERT INTO cabin VALUES
    (19,10,'lux',3,790);
INSERT INTO cabin VALUES
    (20,9,'standart',3,670);
INSERT INTO cabin VALUES
    (21,8,'standart',3,730);
INSERT INTO cabin VALUES
    (22,7,'standart',3,790);
INSERT INTO cabin VALUES
    (23,6,'standart',2,440);
INSERT INTO cabin VALUES
    (24,5,'standart',1,700);
INSERT INTO cabin VALUES
    (25,4,'lux',5,7000);

--вставка в port
INSERT INTO port VALUES
    (1,'5;4','Jon1','ASss','Mosk',700,900,430);
INSERT INTO port VALUES
    (2,'50;4','Jon2','NoRuss','Mosk1',700,900,430);
INSERT INTO port VALUES
    (3,'5;74','Jon3','Luck','Mosk2',700,900,430);
INSERT INTO port VALUES
    (4,'5;49','Jon4','Mucc','Mosk3',700,900,430);
INSERT INTO port VALUES
    (5,'56;84','Jon5','Bus','Mosk3',700,900,430);
INSERT INTO port VALUES
    (6,'52;40','Jon6','ASss','Mosk5',700,900,430);
INSERT INTO port VALUES
    (7,'51;14','Jon7','ASss','Mosk5',700,900,430);



--вставка в port_for_flight
INSERT INTO port_for_flight VALUES
    (1,2);
INSERT INTO port_for_flight VALUES
    (1,3);
INSERT INTO port_for_flight VALUES
    (1,4);
INSERT INTO port_for_flight VALUES
    (1,5);
INSERT INTO port_for_flight VALUES
    (1,6);
INSERT INTO port_for_flight VALUES
    (2,2);
INSERT INTO port_for_flight VALUES
    (2,7);
INSERT INTO port_for_flight VALUES
    (2,9);
INSERT INTO port_for_flight VALUES
    (2,10);
INSERT INTO port_for_flight VALUES
    (3,4);
INSERT INTO port_for_flight VALUES
    (3,5);
INSERT INTO port_for_flight VALUES
    (3,8);
INSERT INTO port_for_flight VALUES
    (3,9);
INSERT INTO port_for_flight VALUES
    (4,2);
INSERT INTO port_for_flight VALUES
    (4,3);
INSERT INTO port_for_flight VALUES
    (4,7);
INSERT INTO port_for_flight VALUES
    (4,8);
INSERT INTO port_for_flight VALUES
    (4,9);
INSERT INTO port_for_flight VALUES
    (4,10);
INSERT INTO port_for_flight VALUES
    (5,1);
INSERT INTO port_for_flight VALUES
    (5,3);
INSERT INTO port_for_flight VALUES
    (5,6);
INSERT INTO port_for_flight VALUES
    (5,8);
INSERT INTO port_for_flight VALUES
    (5,10);
INSERT INTO port_for_flight VALUES
    (6,2);
INSERT INTO port_for_flight VALUES
    (6,3);
INSERT INTO port_for_flight VALUES
    (6,10);
INSERT INTO port_for_flight VALUES
    (7,2);
INSERT INTO port_for_flight VALUES
    (7,3);
INSERT INTO port_for_flight VALUES
    (7,8);


--вставка в customer
INSERT INTO customer VALUES
    (1,'6578909876','Azz','Zaz','Rwq',55,643);
INSERT INTO customer VALUES
    (2,'6000909876','Azzh','Zazerf','Rwqed',15,4323);
INSERT INTO customer VALUES
    (3,'6888909876','Azzfg','Zazref','Rwqfe',53,64233);
INSERT INTO customer VALUES
    (4,'6578000876','Azzhgd','Zazwe','Rwqfe',56,61443);
INSERT INTO customer VALUES
    (5,'6578111876','Azzdfgt','Zazq','Rwqqq',44,677843);
INSERT INTO customer VALUES
    (6,'6578345876','Azzhdt','Zazpp','Rwqfg',21,61343);
INSERT INTO customer VALUES
    (7,'6578295876','Azzsdrd','Zazqq','Rwqge',65,643543);
INSERT INTO customer VALUES
    (8,'6578651876','Azz','Zaz','Rwqgth',2,645633);
INSERT INTO customer VALUES
    (9,'6575689876','Azzfd','Zaz','Rwqrsgh',1,636543);
INSERT INTO customer VALUES
    (10,'6500889876','Azzdf','Zazzzz','Rwqsg',3,64323);
INSERT INTO customer VALUES
    (11,'6234769876','Azzqq','Zaz','Rwqqqqq',88,63143);
INSERT INTO customer VALUES
    (12,'6223309876','Azzra','Zazaa','Rwqsg',33,67843);
INSERT INTO customer VALUES
    (13,'6745329876','Azzgerw','Zazer','Rwqgst',225,23643);
INSERT INTO customer VALUES
    (14,'6578452213','Azzye','Zazg','Rwqgth',511,43643);



















