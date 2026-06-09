-- ============================================================
-- CAPSTONE — Chapter 4: Subqueries
-- Joining Data in SQL — Final Analysis
-- ============================================================
-- You are a data analyst preparing a report on global development.
-- Complete the three queries below using subqueries.
-- ============================================================

-- PART A (Semi join)
-- Find all countries in Asia whose official language is also spoken
-- officially in at least one European country.
-- Return: countries.name, ordered A→Z.
-- Tables: countries, languages
-- Hint: A semi join on language name where official = 'TRUE' in both regions.

-- TODO Part A:
SELECT c.name
FROM countries AS c
JOIN languages AS l ON c.code = l.code
WHERE c.continent = 'Asia'
  AND l.official = 'TRUE'
  AND l.name IN (
      SELECT l2.name
      FROM languages AS l2
      JOIN countries AS c2 ON l2.code = c2.code
      WHERE c2.continent = 'Europe'
        AND l2.official = 'TRUE'
  )
ORDER BY c.name ASC;

-- ============================================================

-- PART B (Subquery in FROM)
-- For each continent, find the average life expectancy in 2015.
-- Return only continents where average life expectancy is above 72.
-- Return: continent, avg_life_exp (rounded to 2 decimal places), ordered DESC.
-- Tables: countries, populations

-- TODO Part B:
SELECT c.continent, ROUND(AVG(p.life_expectancy), 2) AS avg_life_exp
FROM countries AS c
JOIN populations AS p ON c.code = p.country_code
WHERE p.year = 2015
GROUP BY c.continent
HAVING AVG(p.life_expectancy) > 72
ORDER BY avg_life_exp DESC;
-- ============================================================

-- PART C (Nested subquery in WHERE)
-- Find countries whose 2015 GDP per capita is above the average GDP per capita
-- of countries in their own continent.
-- Return: countries.name, economies.gdp_percapita, countries.continent
-- ordered by gdp_percapita DESC, limit 10.
-- Tables: countries, economies
-- Hint: The subquery in WHERE needs to calculate AVG(gdp_percapita)
--       filtered to the same continent as the outer row.

-- TODO Part C:

SELECT c.name, e.gdp_percapita, c.continent
FROM countries AS c
JOIN economies AS e ON c.code = e.code   
WHERE e.year = 2015                               
  AND e.gdp_percapita > (                         
      SELECT AVG(gdp_percapita)
      FROM economies AS e2
      JOIN countries AS c2 ON e2.code = c2.code
      WHERE c2.continent = c.continent            
        AND e2.year = 2015
  )
ORDER BY e.gdp_percapita DESC
LIMIT 10;
