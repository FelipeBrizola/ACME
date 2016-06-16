create table routes(
    id integer PRIMARY KEY,
    airline_id character varying(255) REFERENCES airlines(id),
    "from" character varying(255) REFERENCES airports(id),
    "to" character varying(255) REFERENCES airports(id),
    codeshare character varying(10),
    stops character varying(10),
    equipment character varying(255)
);
