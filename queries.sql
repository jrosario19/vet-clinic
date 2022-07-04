/*Queries that provide answers to the questions from all projects.*/
/* Find all animals whose name ends in "mon". */
SELECT * from animals WHERE name like '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT * from animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2020-01-01';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT * from animals WHERE escape_attempts < 3 AND neutered = TRUE;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered = TRUE;

/* Find all animals not named Gabumon */
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
