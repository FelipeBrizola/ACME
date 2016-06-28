
create table flights (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id),
    departure character varying(20) NOT NULL,
    price real NOT NULL,
    sales_id INTEGER
);
