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
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name TEXT,
    age INT,
    PRIMARY KEY(id)
);


CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD COLUMN id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners (id);

/* Milestone 4 */
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT,
    vets_id INT,
    PRIMARY KEY (species_id, vets_id),
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vets_id) REFERENCES vets (id)
);

CREATE TABLE visits (
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY (animals_id, vets_id, date_of_visit),
    FOREIGN KEY (animals_id) REFERENCES animals (id),
    FOREIGN KEY (vets_id) REFERENCES vets (id)
);