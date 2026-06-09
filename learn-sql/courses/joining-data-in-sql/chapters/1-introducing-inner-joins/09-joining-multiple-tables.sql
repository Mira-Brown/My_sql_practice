-- Exercise: Joining multiple tables
-- Objective: Write a 3-table INNER JOIN combining countries, populations, and economies.
--
-- Instructions:
--   1. Alias: countries = 'c', populations = 'p', economies = 'e'.
--   2. SELECT:
--        - c.name AS country
--        - p.life_expectancy
--        - e.gdp_percapita
--   3. INNER JOIN populations onto countries ON c.code = p.country_code
--   4. INNER JOIN economies onto countries USING (code)
--   5. Filter to year 2015 (use e.year = 2015 — both tables have a year column so be specific).
--   6. ORDER BY life_expectancy descending.
--   7. LIMIT to 10 rows.

SELECT c.name AS country,
       p.life_expectancy,
       e.gdp_percapita
FROM countries AS c
 INNER JOIN populations AS p ON c.code = p.country_code
 INNER JOIN economies AS e USING (code)
WHERE e.year = 2015
ORDER BY life_expectancy DESC
LIMIT 10;
