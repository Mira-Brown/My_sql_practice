
--  The ins and outs of INNER JOIN
SELECT cities.name AS city,
       countries.name AS country,
       countries.continent
FROM cities
INNER JOIN countries ON countries.code = cities.country_code
LIMIT 10; 

SELECT *
FROM countries

SELECT *
FROM economies

-- Objective: Use INNER JOIN to combine the countries and economies tables.
--   1. SELECT the country name (from countries) and GDP per capita (from economies).
--   2. INNER JOIN economies onto countries using: countries.code = economies.code.
--   3. Filter to only rows where year = 2015.
--   4. ORDER BY gdp_percapita descending so the wealthiest countries appear first.
--   5. LIMIT to 10 rows.


SELECT countries.name, economies.gdp_percapita
FROM countries
INNER JOIN economies ON countries.code = economies.code
WHERE year = 2015
ORDER BY gdp_percapita DESC
LIMIT 10;

-- Exercise: Joining with aliased tables
--   1. Alias the countries table as 'c' and the languages table as 'l'.
--   2. SELECT:
--        - country name (from c)
--        - continent (from c)
--        - language name (from l)
--        - whether the language is official (from l)
--   3. INNER JOIN languages onto countries using the shared code column.
--   4. Use your aliases everywhere — on the JOIN, the ON clause, and all SELECT columns.

SELECT c.name AS country,
       c.continent,
       l.name AS language,
       l.official
FROM countries AS c
INNER JOIN languages AS l ON c.code = l.code
LIMIT 15;

SELECT c.name AS country,
       COUNT(ci.name) AS num_cities
FROM countries AS c
INNER JOIN cities AS ci ON c.code = ci.country_code
GROUP BY c.name
ORDER BY num_cities DESC
LIMIT 10;

SELECT c.name AS country,
       e.gdp_percapita,
       cu.basic_unit AS currency
FROM countries AS c
INNER JOIN economies AS e USING (code)
INNER JOIN currencies AS cu USING (code)
WHERE e.year = 2015
ORDER BY e.gdp_percapita DESC
LIMIT 10;

SELECT c.name AS country,
       ci.name AS city,
       l.name AS language
FROM countries AS c
INNER JOIN cities AS ci ON c.code = ci.country_code
INNER JOIN languages AS l USING (code)
WHERE continent = 'Asia'
LIMIT 10;
