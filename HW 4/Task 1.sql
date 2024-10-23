-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname VARCHAR(50) NOT NULL,   -- Pet's name
  owner VARCHAR(50) NOT NULL,     -- Owner's name
  species VARCHAR(30),            -- Pet's species (cat, dog, etc.)
  gender CHAR(1),                 -- Gender (M or F)
  birth DATE,                     -- Birthdate
  death DATE,                     -- Death date (NULL if alive)
  PRIMARY KEY (petname)           -- Primary key on petname
);

CREATE TABLE petEvent (
  petname VARCHAR(50) NOT NULL,   -- Pet's name, must match a pet in petPet
  eventdate DATE NOT NULL,        -- Event date
  eventtype VARCHAR(20),          -- Type of event (e.g., vet, litter)
  remark VARCHAR(255),            -- Additional remarks
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE, -- Link to petPet
  PRIMARY KEY (petname, eventdate) -- Composite primary key (petname, eventdate)
);