-- setup.sql — build the Sakila DVD-rental database in PostgreSQL
--
-- This course runs on PostgreSQL (NOT SQLite). It uses Postgres-only
-- features: ARRAY columns, INTERVAL arithmetic, EXTRACT / DATE_TRUNC,
-- tsvector full-text search, user-defined types, and the extensions
-- fuzzystrmatch (levenshtein) + pg_trgm (similarity).
--
-- Usage (run from this database/ dir):
--   createdb sakila
--   psql -v ON_ERROR_STOP=1 -d sakila -f setup.sql
-- or just run ./setup.sh which does the createdb + load for you.
--
-- DATA LOAD: postgres-sakila-schema_v3.sql pulls each table's data with
--   COPY ... FROM PROGRAM 'curl https://assets.datacamp.com/...'
-- so the load needs:
--   • a SUPERUSER role (FROM PROGRAM is superuser-only), and
--   • outbound internet + `curl` on the database host.
-- If your server can't reach the internet, download the CSVs once and
-- swap the COPY ... FROM PROGRAM lines for `\copy <table> FROM 'file.csv'`.

-- ------------------------------------------------------------------
-- 1. User-defined types (must exist BEFORE the tables that use them)
-- ------------------------------------------------------------------

-- `year` is a MySQL type; PostgreSQL has none, so Sakila ships it as a
-- DOMAIN. film.release_year depends on this.
DROP DOMAIN IF EXISTS year CASCADE;
CREATE DOMAIN year AS integer
    CHECK (VALUE >= 1901 AND VALUE <= 2155);

-- mpaa_rating enum — a user-defined type the Chapter 4 lessons inspect
-- ("User-defined data types", "Getting info about user-defined data types").
DROP TYPE IF EXISTS mpaa_rating CASCADE;
CREATE TYPE mpaa_rating AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17');

-- ------------------------------------------------------------------
-- 2. Tables + data (DataCamp-provided schema; bugs fixed in-file:
--    language ')' typo, special_features → text[], year domain above)
-- ------------------------------------------------------------------
\i postgres-sakila-schema_v3.sql

-- ------------------------------------------------------------------
-- 3. Extensions used in Chapter 4
-- ------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;   -- levenshtein(), soundex()
CREATE EXTENSION IF NOT EXISTS pg_trgm;         -- similarity(), word_similarity()

-- ------------------------------------------------------------------
-- 4. Indexes on common join / filter columns
-- ------------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_film_language      ON film(language_id);
CREATE INDEX IF NOT EXISTS idx_inventory_film     ON inventory(film_id);
CREATE INDEX IF NOT EXISTS idx_rental_inventory   ON rental(inventory_id);
CREATE INDEX IF NOT EXISTS idx_rental_customer    ON rental(customer_id);
CREATE INDEX IF NOT EXISTS idx_payment_rental     ON payment(rental_id);
CREATE INDEX IF NOT EXISTS idx_payment_customer   ON payment(customer_id);
CREATE INDEX IF NOT EXISTS idx_film_actor_film    ON film_actor(film_id);
CREATE INDEX IF NOT EXISTS idx_film_category_film ON film_category(film_id);
CREATE INDEX IF NOT EXISTS idx_customer_address   ON customer(address_id);
CREATE INDEX IF NOT EXISTS idx_address_city       ON address(city_id);
CREATE INDEX IF NOT EXISTS idx_city_country       ON city(country_id);

-- ------------------------------------------------------------------
-- 5. Row counts — verify the load
-- ------------------------------------------------------------------
SELECT 'actor'    AS table_name, COUNT(*) FROM actor
UNION ALL SELECT 'film',         COUNT(*) FROM film
UNION ALL SELECT 'category',     COUNT(*) FROM category
UNION ALL SELECT 'film_actor',   COUNT(*) FROM film_actor
UNION ALL SELECT 'film_category',COUNT(*) FROM film_category
UNION ALL SELECT 'inventory',    COUNT(*) FROM inventory
UNION ALL SELECT 'rental',       COUNT(*) FROM rental
UNION ALL SELECT 'payment',      COUNT(*) FROM payment
UNION ALL SELECT 'customer',     COUNT(*) FROM customer
UNION ALL SELECT 'address',      COUNT(*) FROM address
UNION ALL SELECT 'city',         COUNT(*) FROM city
UNION ALL SELECT 'country',      COUNT(*) FROM country
UNION ALL SELECT 'language',     COUNT(*) FROM language
UNION ALL SELECT 'staff',        COUNT(*) FROM staff
UNION ALL SELECT 'store',        COUNT(*) FROM store
ORDER BY table_name;
