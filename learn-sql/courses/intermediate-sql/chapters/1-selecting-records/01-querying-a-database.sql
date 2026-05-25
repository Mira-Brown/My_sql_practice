-- Lesson 1: Querying a Database
-- Type: Video (▶)
--
-- Key ideas:
--   SELECT  — which columns to return
--   FROM    — which table to read from
--   *       — wildcard meaning "all columns"
--   Queries end with a semicolon.

-- Example 1: select one column
SELECT title
FROM films;

-- Example 2: select multiple columns
SELECT title, release_year, country
FROM films;

-- Example 3: select everything (all columns)
SELECT *
FROM films;
