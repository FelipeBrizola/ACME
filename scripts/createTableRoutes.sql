create table routes(
    airline_id character varying(255) REFERENCES airlines(airline_id),
    "from" character varying(255) REFERENCES airports(airport_id),
    "to" character varying(255) REFERENCES airports(airport_id),
    codeshare character varying(10),
    stops character varying(10),
    equipment character varying(255)
);
