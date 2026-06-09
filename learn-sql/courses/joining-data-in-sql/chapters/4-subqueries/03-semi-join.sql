-- Exercise: Semi join
-- Objective: Use a semi join to find languages spoken in the Middle East.
-- Instructions:
--   1. SELECT DISTINCT name from the languages table, aliased as language.
--   2. ORDER BY language ascending.
--   3. Filter with WHERE so only languages spoken in countries
--      in the Middle East region (from the countries table) are returned.
--      Use a subquery inside WHERE to get the country codes for the Middle East.

-- TODO: Write your semi join here

SELECT DISTINCT name AS language
FROM languages 
WHERE code IN (
    SELECT code FROM countries
    WHERE region = 'Middle East'
);

