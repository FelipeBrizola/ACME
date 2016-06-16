<<<<<<< HEAD
﻿create table flights (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id),
    "date" date NOT NULL,
    price real NOT NULL,
=======
create table flights (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id),
    "date" date NOT NULL,
    price real NOT NULL;
>>>>>>> origin/master
    sales_id INTEGER
);
