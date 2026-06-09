-- Exercise: Inspecting a relationship
-- Objective: Use INNER JOIN + aggregation to inspect the 1:M relationship
--            between countries and populations.
--
-- Instructions:
--   1. Alias countries as 'c' and populations as 'p'.
--   2. SELECT:
--        - country name (c.name AS country)
--        - the population size (p.size AS population)
--        - the year (p.year)
--   3. INNER JOIN populations onto countries USING (code).
--      Note: populations uses country_code, not code — so use ON instead:
--            ON c.code = p.country_code
--   4. Filter to only rows where year = 2015.
--   5. ORDER BY population descending.
--   6. LIMIT to 10 rows.

SELECT c.name AS country,
       p.size AS population,
       p.year
FROM countries AS c
INNER JOIN populations AS p ON c.code = p.country_code
WHERE year = 2015
ORDER BY population DESC
LIMIT 10;
