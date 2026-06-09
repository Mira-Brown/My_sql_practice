-- Exercise: All joins on deck
-- Objective: Use a LEFT JOIN to find European countries and their
--            official language(s), then a self join on populations
--            to add population size in 2010 and 2015 side by side.
--
-- Do this in two separate queries:
--
-- Query 1 — LEFT JOIN
--   SELECT c.name AS country, l.name AS language, l.official
--   FROM countries AS c
--   LEFT JOIN languages AS l ON c.code = l.code
--   WHERE c.continent = 'Europe'
--   ORDER BY country, language;
--
-- Query 2 — Self join
--   SELECT p1.country_code,
--          p1.size AS pop_2010,
--          p2.size AS pop_2015
--   FROM populations AS p1
--   INNER JOIN populations AS p2
--       ON p1.country_code = p2.country_code
--       AND p1.year = 2010
--       AND p2.year = 2015
--   ORDER BY p1.country_code;

-- TODO: write both queries below

-- Query 1:
SELECT
    c.name      AS country,
    l.name      AS language,
    l.official
FROM countries AS c
LEFT JOIN languages AS l
    ON c.code = l.code
WHERE c.continent = 'Europe'
ORDER BY country, language;

-- Query 2:
SELECT
    p1.country_code,
    p1.size     AS pop_2010,
    p2.size     AS pop_2015
FROM populations AS p1
INNER JOIN populations AS p2
    ON p1.country_code = p2.country_code
    AND p1.year = 2010
    AND p2.year = 2015
ORDER BY p1.country_code;