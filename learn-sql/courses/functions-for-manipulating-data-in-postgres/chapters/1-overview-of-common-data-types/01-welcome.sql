-- Lesson 1: Welcome!
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (table set: film, actor, rental, payment, customer, …)
--
-- This course: Functions for Manipulating Data in PostgreSQL
-- Four chapters:
--   Ch1 — Common Data Types (text, numeric, date/time, arrays)
--   Ch2 — DATE/TIME Functions and Operators
--   Ch3 — Parsing and Manipulating Text
--   Ch4 — Full-text Search and PostgreSQL Extensions
--
-- Every query runs against the Sakila DVD-rental database.
-- Run queries with psql: psql -U postgres -d sakila -c "SELECT ..."

-- Runnable intro: peek at the film table — note the data types
SELECT film_id,
       title,
       release_year,        -- type: year (user-defined domain)
       rental_duration,     -- type: smallint
       rental_rate,         -- type: numeric(4,2)
       last_update,         -- type: timestamp
       special_features     -- type: text[] (ARRAY)
FROM film
LIMIT 5;
