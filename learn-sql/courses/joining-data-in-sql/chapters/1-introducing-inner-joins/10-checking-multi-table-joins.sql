-- Exercise: Checking multi-table joins
-- Objective: Join countries, cities, and languages in one query to verify
--            multi-table join behaviour across 3 related tables.
--
-- Instructions:
--   1. Alias: countries = 'c', cities = 'ci', languages = 'l'.
--   2. SELECT:
--        - c.name AS country
--        - ci.name AS city
--        - l.name AS language
--   3. INNER JOIN cities AS ci ON c.code = ci.country_code
--   4. INNER JOIN languages AS l USING (code)
--   5. Filter to the continent 'Asia'.
--   6. LIMIT to 10 rows.

SELECT c.name AS country,
       ci.name AS city,
       l.name AS language
FROM countries AS c
INNER JOIN cities AS ci ON c.code = ci.country_code
INNER JOIN languages AS l USING (code)
WHERE continent = 'Asia'
LIMIT 10;
