/* Populate database with sample data. */

/*INSERTION 1*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);

/*INSERTION 2*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.0);

/*INSERTION 3*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);

/*INSERTION 4*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11.00); 

/* Milestone 2: Insertion */
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (5, 'Charmander', '2020-02-08', -11.0, FALSE, 0, 'spec');

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (6, 'Plantmon', '2021-11-15', -5.7, TRUE, 2, 'spec');

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (7, 'Squirtle', '1993-4-2', -12.13, FALSE, 3, 'spec');

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (8, 'Angemon', '2005-06-12', -45.0, TRUE, 1, 'spec');

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (9, 'Boarmon', '2005-06-07', 20.4, TRUE, 7, 'spec');

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (10, 'Blossom', '1998-10-13', 17.0, TRUE, 3, 'spec');


INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered,escape_attempts, species)
VALUES (11, 'Ditto', '2022-05-14', 22.0, TRUE, 4, 'spec');


/* Milestone 3 */

INSERT INTO owners (full_name, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';