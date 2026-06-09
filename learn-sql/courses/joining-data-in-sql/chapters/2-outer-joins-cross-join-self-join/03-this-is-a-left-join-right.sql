-- Exercise: This is a LEFT JOIN, right?
-- Objective: Use LEFT JOIN to return all countries with their region,
--            continent, and GDP per capita (where available).
--
-- Instructions:
--   1. SELECT name, region, continent from the countries table
--      and gdp_percapita from the economies table.
--   2. Alias countries as c and economies as e.
--   3. LEFT JOIN economies onto countries using the shared key: c.code = e.code.
--   4. Filter for the year 2010 using WHERE.
--
-- Reminder: ON uses the join key column; SELECT uses the display value columns.

-- TODO: write your LEFT JOIN query here
SELECT c.name AS country,
       r.region,
       c.continent,
       e.gdp_percapita AS gdp
FROM countries AS c       
LEFT JOIN economies AS e ON c.code = e.code
WHERE year = 2010;

       