create table sales(
    id SERIAL PRIMARY KEY,
    description character varying(255) NOT NULL,
    discount integer NOT NULL,
    begin_date date,
    end_date date,
    alliance_id integer
);
