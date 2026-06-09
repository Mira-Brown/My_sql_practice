-- Exercise: Building on your LEFT JOIN
-- Objective: Extend a LEFT JOIN by chaining a second LEFT JOIN
--            to bring in currency information alongside GDP data.
--
-- Instructions:
--   1. SELECT c.name AS country, e.gdp_percapita, e.year,
--             cu.basic_unit AS currency
--   2. FROM countries AS c
--   3. LEFT JOIN economies AS e ON c.code = e.code
--   4. Chain a second LEFT JOIN: currencies AS cu ON c.code = cu.code
--   5. Filter for year 2010 using WHERE.
--   6. ORDER BY gdp_percapita DESC.
--
-- Reminder: each LEFT JOIN attaches to the same left table (countries).
--           Use c.code as the key for both joins.

-- TODO: write your chained LEFT JOIN query here
SELECT
    c.name          AS country,
    e.gdp_percapita,
    e.year,
    cu.basic_unit   AS currency
FROM countries AS c
LEFT JOIN economies AS e
    ON c.code = e.code
LEFT JOIN currencies AS cu
    ON c.code = cu.code
WHERE e.year = 2010
ORDER BY e.gdp_percapita DESC;