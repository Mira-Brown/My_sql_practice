-- Lesson 10: Enabling extensions
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Exercise: Enable extensions and verify they are installed
-- Objective: Use CREATE EXTENSION IF NOT EXISTS to enable fuzzystrmatch and pg_trgm,
--            then confirm both appear as installed in pg_available_extensions.
--
-- Instructions:
--   Part 1 — enable the two extensions:
--     1a. Enable fuzzystrmatch using CREATE EXTENSION IF NOT EXISTS.
--     1b. Enable pg_trgm using CREATE EXTENSION IF NOT EXISTS.
--
--   Part 2 — verify installation:
--     2.  Select name and installed_version from pg_available_extensions.
--         Filter to where name is either 'fuzzystrmatch' or 'pg_trgm'.
--         Order by name ascending.

-- Part 1: enable extensions
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Part 2: verify
SELECT
    name,
    installed_version
FROM pg_available_extensions
WHERE
    name IN ('fuzzystrmatch', 'pg_trgm')
ORDER BY name
;
