create table tickets (
    id SERIAL PRIMARY KEY,
    flight_id INTEGER REFERENCES flights(id),
    user_id INTEGER REFERENCES users(id),
    status character varying(100),
    seat character varying(100)
);
