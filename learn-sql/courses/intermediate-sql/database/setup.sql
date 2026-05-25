-- setup.sql — build intermediate-sql.db from 4 CSVs (films, people, reviews, roles)
-- Run: sqlite3 intermediate-sql.db < setup.sql
--
-- CSVs have no header rows. Column order inferred from positional types
-- and matches DataCamp's intermediate-SQL films dataset.
--
-- Relationships:
--   films.id   (1)─(M) roles.film_id
--   people.id  (1)─(M) roles.person_id
--   films.id   (1)─(1) reviews.film_id

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS people;

-- films: one row per film
CREATE TABLE films (
    id            INTEGER PRIMARY KEY,
    title         TEXT,
    release_year  INTEGER,
    country       TEXT,
    duration      INTEGER,
    language      TEXT,
    certification TEXT,
    gross         INTEGER,
    budget        INTEGER
);

-- people: one row per actor/director
CREATE TABLE people (
    id        INTEGER PRIMARY KEY,
    name      TEXT,
    birthdate TEXT,   -- ISO 8601 (YYYY-MM-DD)
    deathdate TEXT    -- ISO 8601 (YYYY-MM-DD), often NULL
);

-- reviews: one row per film's aggregated review data (1:1 with films)
CREATE TABLE reviews (
    film_id            INTEGER PRIMARY KEY,
    num_user_reviews   INTEGER,
    num_critic_reviews INTEGER,
    imdb_score         REAL,
    num_votes          INTEGER,
    facebook_likes     INTEGER,
    FOREIGN KEY (film_id) REFERENCES films(id)
);

-- roles: join table linking films <-> people, with role label ('actor' or 'director')
CREATE TABLE roles (
    id        INTEGER PRIMARY KEY,
    film_id   INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    role      TEXT,
    FOREIGN KEY (film_id)   REFERENCES films(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

-- Load CSVs
.mode csv
.import ../csv/films.csv films
.import ../csv/people.csv people
.import ../csv/reviews.csv reviews
.import ../csv/roles.csv roles

-- Empty strings -> NULL
UPDATE films SET country       = NULLIF(country,'');
UPDATE films SET release_year  = NULLIF(release_year,'');
UPDATE films SET duration      = NULLIF(duration,'');
UPDATE films SET language      = NULLIF(language,'');
UPDATE films SET certification = NULLIF(certification,'');
UPDATE films SET gross         = NULLIF(gross,'');
UPDATE films SET budget        = NULLIF(budget,'');

UPDATE people SET birthdate = NULLIF(birthdate,'');
UPDATE people SET deathdate = NULLIF(deathdate,'');

UPDATE reviews SET num_user_reviews   = NULLIF(num_user_reviews,'');
UPDATE reviews SET num_critic_reviews = NULLIF(num_critic_reviews,'');
UPDATE reviews SET imdb_score         = NULLIF(imdb_score,'');
UPDATE reviews SET num_votes          = NULLIF(num_votes,'');
UPDATE reviews SET facebook_likes     = NULLIF(facebook_likes,'');

-- Indexes on foreign-key columns (PK columns are already indexed)
CREATE INDEX idx_roles_film_id   ON roles(film_id);
CREATE INDEX idx_roles_person_id ON roles(person_id);
CREATE INDEX idx_roles_role      ON roles(role);
CREATE INDEX idx_films_release_year ON films(release_year);
CREATE INDEX idx_films_country      ON films(country);

PRAGMA foreign_keys = ON;

-- Row counts
.headers on
.mode column
SELECT 'films'   AS table_name, COUNT(*) AS rows FROM films
UNION ALL SELECT 'people',   COUNT(*) FROM people
UNION ALL SELECT 'reviews',  COUNT(*) FROM reviews
UNION ALL SELECT 'roles',    COUNT(*) FROM roles;
