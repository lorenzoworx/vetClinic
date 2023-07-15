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

