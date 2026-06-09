-- Exercise: INTERSECT
-- Objective: Find countries and cities that share the same name.
--
-- The countries table has a name column.
-- The cities table also has a name column.
-- Some city names are the same as country names (e.g. a capital named after its country).
--
-- Instructions:
--   1. SELECT name FROM countries
--      INTERSECT
--      SELECT name FROM cities
--   2. ORDER BY name

-- TODO: Write your query here
SELECT name
FROM countries
INTERSECT
SELECT name
FROM cities
ORDER BY name;