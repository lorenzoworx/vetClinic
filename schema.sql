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

