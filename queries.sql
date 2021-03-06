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


/* Queries that alter table */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT anticipate_2022;

UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO anticipate_2022;

UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

/* Queries to get results */

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;

/* Milestone 3 */
/* What animals belong to Melody Pond? */
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon) */
SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT owners.full_name, animals.name FROM animals
FULL JOIN owners ON animals.owner_id = owners.id;

/* How many animals are there per species? */
SELECT species.name, COUNT(*) FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;


/* Who owns the most animals? */
SELECT owners.full_name FROM animals
JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(owner_id) DESC
LIMIT 1;

/* Milestone 4 */
/* Who was the last animal seen by William Tatcher? */
SELECT animals.name FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
SELECT COUNT(animals.name) FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */
SELECT vets.name, species.name FROM vets
FULL JOIN specializations ON specializations.vets_id = vets.id
FULL JOIN species ON species.id = specializations.species_id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? */
SELECT animals.name, COUNT(*) FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
SELECT animals.name FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT animals.*, vets.*, visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(*) FROM visits
FULL JOIN animals ON animals.id = visits.animals_id
FULL JOIN vets ON visits.vets_id = vets.id
FULL JOIN specializations ON specializations.vets_id = vets.id
WHERE specializations.species_id IS NULL;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
