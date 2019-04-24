
CREATE TABLE IF NOT EXISTS flight(
    id_flight            SERIAL PRIMARY KEY,
    go_out               DATE NOT NULL,
    go_in                DATE NOT NULL,
    length               INTEGER NOT NULL CHECK(length > 0),
    quantity_empty_place INTEGER NOT NULL CHECK(quantity_empty_place >= 0),
    quantity_busy_place  INTEGER NOT NULL CHECK(quantity_busy_place >= 0),
    quantity_empty_cargo INTEGER NOT NULL CHECK(quantity_empty_cargo >= 0),
    quantity_busy_cargo  INTEGER NOT NULL CHECK(quantity_busy_cargo >= 0),
    check (flight.go_out < flight.go_in)
);

CREATE TABLE IF NOT EXISTS captain(
    id_capitan                SERIAL PRIMARY KEY,
    number_passport           VARCHAR(10) NOT NULL UNIQUE CHECK(number_passport SIMILAR TO '[0-9]{10}'),
    first_name                VARCHAR(20) NOT NULL CHECK(first_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    second_name               VARCHAR(20) NOT NULL CHECK(second_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    third_name                VARCHAR(20) NOT NULL CHECK(third_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    quantity_years_experience INTEGER NOT NULL CHECK(quantity_years_experience >= 0),
    number_of_work_permit     INTEGER NOT NULL UNIQUE CHECK(number_of_work_permit > 0)
);

CREATE TABLE IF NOT EXISTS ship(
    id_ship               SERIAL PRIMARY KEY,
    name                  VARCHAR(20) NOT NULL UNIQUE,
    act_cancellation      INTEGER NULL UNIQUE CHECK(act_cancellation > 0),
    year_both             INTEGER NOT NULL CHECK(year_both > 1700),
    service_price         INTEGER NOT NULL,
    status                VARCHAR(20) NOT NULL CHECK(status IN ('swim', 'in port', 'in junk', 'pirats')),
    quantity_place_lux    INTEGER NOT NULL CHECK(quantity_place_lux >= 0),
    quantity_place_stand  INTEGER NOT NULL CHECK(quantity_place_stand >= 0),
    tonnage               INTEGER NULL CHECK(tonnage >= 0),
    rank                  CHAR NOT NULL CHECK(rank IN ('A', 'B', 'C'))
);

CREATE TABLE IF NOT EXISTS ship_for_flight(
    id_ship          INTEGER REFERENCES ship,
    id_flight        INTEGER REFERENCES flight,
    quantity_empty_place_lux INTEGER NOT NULL CHECK(quantity_empty_place_lux >= 0),
    quantity_busy_place_lux  INTEGER NOT NULL CHECK(quantity_busy_place_lux >= 0),
    quantity_empty_place_stand INTEGER NOT NULL CHECK(quantity_empty_place_stand >= 0),
    quantity_busy_place_stand  INTEGER NOT NULL CHECK(quantity_busy_place_stand >= 0),
    quantity_empty_gr INTEGER NOT NULL CHECK(quantity_empty_gr >= 0),
    quantity_busy_gr  INTEGER NOT NULL CHECK(quantity_busy_gr >= 0),
    PRIMARY KEY (id_ship, id_flight)
);

CREATE TABLE IF NOT EXISTS captain_for_flight(
    id_ship         INTEGER,
    id_flight       INTEGER,
    id_capitan      INTEGER REFERENCES captain,
    FOREIGN KEY (id_ship, id_flight) REFERENCES ship_for_flight(id_ship, id_flight),
    PRIMARY KEY (id_ship, id_flight, id_capitan)
);

CREATE TABLE IF NOT EXISTS cabin(
    id_cabin       SERIAL PRIMARY KEY,
    id_ship        INTEGER REFERENCES ship,
    class          VARCHAR(10) NOT NULL CHECK(class IN ('lux', 'standart')),
    quantity_place INTEGER NOT NULL CHECK(quantity_place >= 0),
    price_between  INTEGER NOT NULL CHECK(price_between >= 0)
);

CREATE TABLE IF NOT EXISTS port(
    id_port         SERIAL PRIMARY KEY,
    coordinates     VARCHAR(20) UNIQUE CHECK(coordinates SIMILAR TO '[0-9]*;[0-9]*'),
    name            VARCHAR(20) NOT NULL UNIQUE,
    country         VARCHAR(20) NOT NULL,
    city            VARCHAR(20) NOT NULL,
    price_parking   INTEGER NOT NULL CHECK(price_parking >= 0),
    price_loading   INTEGER NOT NULL CHECK(price_loading >= 0),
    price_unloading INTEGER NOT NULL CHECK(price_unloading >= 0)
);

CREATE TABLE IF NOT EXISTS port_for_flight(
    id_port   INTEGER REFERENCES port,
    id_flight INTEGER REFERENCES flight,
    PRIMARY KEY (id_port,id_flight)
);

CREATE TABLE IF NOT EXISTS customer(
    id_customer      SERIAL PRIMARY KEY,
    number_passport  VARCHAR(10) NOT NULL UNIQUE CHECK(number_passport SIMILAR TO '[0-9]{10}'),
    first_name       VARCHAR(20) NOT NULL CHECK(first_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    second_name      VARCHAR(20) NOT NULL CHECK(second_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    third_name       VARCHAR(20) NOT NULL CHECK(third_name SIMILAR TO '[A-Z][a-z]{1,19}'),
    number_foto      INTEGER NOT NULL UNIQUE CHECK(number_foto > 0),
    internal_account INTEGER NOT NULL UNIQUE CHECK(internal_account > 0)
);


CREATE TABLE IF NOT EXISTS ticket(
    id_ticket             SERIAL PRIMARY KEY, 
    class_ticket          VARCHAR(10) NOT NULL CHECK(class_ticket IN ('lux', 'standart')),
    id_cabin              INTEGER REFERENCES cabin,
    id_port_from          INTEGER NOT NULL CHECK(id_port_from>0),
    id_port_where         INTEGER NOT NULL CHECK(id_port_where>0),
    id_flight             INTEGER NOT NULL CHECK(id_flight>0),
    price                 INTEGER NOT NULL,
    id_customer           INTEGER REFERENCES customer,
    CHECK                 (id_port_from!=id_port_where),
    FOREIGN KEY (id_port_from,id_flight) REFERENCES port_for_flight (id_port,id_flight),
    FOREIGN KEY (id_port_where,id_flight) REFERENCES port_for_flight (id_port,id_flight)
);



CREATE TABLE IF NOT EXISTS customers_for_lux(
    id_ticket       INTEGER REFERENCES ticket,
    id_customer     INTEGER REFERENCES customer,
    PRIMARY KEY(id_ticket, id_customer)
);

CREATE TABLE IF NOT EXISTS ship_declaration(
    id_declaration     SERIAL PRIMARY KEY,
    total_tonnage      INTEGER NOT NULL CHECK(total_tonnage > 0),
    total_price        INTEGER NOT NULL CHECK(total_price > 0),
    id_port_from       INTEGER NOT NULL CHECK(id_port_from>0),
    id_port_where      INTEGER NOT NULL CHECK(id_port_from>0),
    id_customer        INTEGER REFERENCES customer,
    id_flight     INTEGER NOT NULL CHECK(id_flight>0),
    FOREIGN KEY (id_port_from,id_flight) REFERENCES port_for_flight (id_port,id_flight),
    FOREIGN KEY (id_port_where,id_flight) REFERENCES port_for_flight (id_port,id_flight)
);

CREATE TABLE IF NOT EXISTS type_of_cargo(
    id_cargo     SERIAL PRIMARY KEY,
    name         VARCHAR(10) NOT NULL UNIQUE,
    price        INTEGER NOT NULL CHECK(price > 0),
    list_things  VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS type_of_cargo_for_declaration(
    id_cargo           INTEGER REFERENCES type_of_cargo,
    id_declaration     INTEGER REFERENCES ship_declaration,
    tonnage            INTEGER NOT NULL CHECK(tonnage > 0),
    price              INTEGER NOT NULL CHECK(price > 0),
    PRIMARY KEY(id_cargo, id_declaration)
);




