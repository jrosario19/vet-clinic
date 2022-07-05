/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

/* Milestone 2: Add Species Table */
ALTER TABLE animals
ADD species varchar(255); 

/* Milestone 3: */
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age integer
 );

 


ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD COLUMN id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;