/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name varchar(50),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species varchar(50);

CREATE TABLE owners (
  id serial PRIMARY KEY,
  full_name varchar(100),
  age integer
);

CREATE TABLE species (
  id serial PRIMARY KEY,
  name varchar(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id integer REFERENCES owners(id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets (id),
  species_id INTEGER REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals (id),
  vet_id INTEGER REFERENCES vets (id),
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date)
);
