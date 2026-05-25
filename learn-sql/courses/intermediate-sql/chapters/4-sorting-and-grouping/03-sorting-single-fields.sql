-- Exercise: Sorting single fields
-- Objective: Use ORDER BY to sort query results by a single column.
--
-- Instructions:
--   1. Select title and duration from films.
--      Sort by duration ascending (shortest first).
--
--   2. Select name from people.
--      Sort alphabetically by name (A to Z).
--
--   3. Select title and gross from films.
--      Sort by gross descending (highest earning first).
--      Limit to 10 results.

-- Query 1
SELECT title, duration
FROM films
ORDER BY duration ASC;

-- Query 2
SELECT name
FROM people
ORDER BY name;

-- Query 3
-- TODO: SELECT title and gross FROM films, ORDER BY gross DESC, LIMIT 10
SELECT title, gross
FROM films
ORDER BY gross DESC 
LIMIT 10;
