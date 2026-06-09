-- ============================================================
-- CAPSTONE — Chapter 1: Introducing Inner Joins
-- ============================================================
-- Scenario:
--   You're a data analyst at a development agency. Your manager
--   wants a country profile report for South America covering
--   economic health, population size, and official languages.
--
-- Deliver a single query that returns:
--   - Country name                    (c.name AS country)
--   - Population size in 2015         (p.size AS population)
--   - GDP per capita in 2015          (e.gdp_percapita)
--   - Official language(s)            (l.name AS language)
--
-- Requirements:
--   1. Use all four tables: countries, populations, economies, languages.
--   2. Use table aliases throughout (c, p, e, l).
--   3. Join populations ON c.code = p.country_code
--      Join economies USING (code)
--      Join languages USING (code)
--   4. Filter to:
--        - continent = 'South America'
--        - p.year = 2015
--        - e.year = 2015
--        - only official languages (l.official = 'TRUE')
--   5. ORDER BY gdp_percapita descending.
-- ============================================================

-- Write your query below:
SELECT
    c.name        AS country,
    p.size        AS population,
    e.gdp_percapita,
    l.name        AS language
FROM countries AS c
INNER JOIN populations AS p
    ON c.code = p.country_code
INNER JOIN economies AS e
    USING (code)
INNER JOIN languages AS l
    USING (code)
WHERE c.continent    = 'South America'
  AND p.year         = 2015
  AND e.year         = 2015
  AND l.official     = 'TRUE'
ORDER BY e.gdp_percapita DESC;