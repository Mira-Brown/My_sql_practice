-- Exercise: Is this RIGHT?
-- Objective: Write a RIGHT JOIN to return all economies rows
--            alongside country information (where available).
--
-- Instructions:
--   1. SELECT c.name AS country, e.gdp_percapita, e.year
--   2. FROM countries AS c
--   3. RIGHT JOIN economies AS e ON c.code = e.code
--   4. Filter for year 2010 using WHERE.
--   5. ORDER BY gdp_percapita DESC.
--
-- Reminder: RIGHT JOIN keeps ALL rows from the right table (economies).
--           The left table (countries) fills in where a match exists.

-- TODO: write your RIGHT JOIN query here

SELECT
    c.name          AS country,
    e.gdp_percapita,
    e.year
FROM countries AS c
RIGHT JOIN economies AS e
    ON c.code = e.code
WHERE e.year = 2010
ORDER BY e.gdp_percapita DESC;