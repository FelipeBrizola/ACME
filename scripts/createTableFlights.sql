
create table flights (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id),
    departure character varying(10) NOT NULL,
    price real NOT NULL;
    sales_id INTEGER
);


-- ALTER TABLE flights
-- ADD departure character varying(10)
--
-- ALTER TABLE flights
-- DROP COLUMN date
-- UPDATE flights
-- SET departure='13/07/2016'
-- WHERE id=1;
