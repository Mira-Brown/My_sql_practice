-- Exercise: Histories and languages
-- Objective: Use CROSS JOIN to pair every Oceanian country
--            with every language spoken in Africa — all possible combinations.
--
-- Instructions:
--   1. SELECT c.name AS country, l.name AS language
--   2. FROM countries AS c
--   3. CROSS JOIN languages AS l
--   4. WHERE c.continent = 'Oceania'
--        AND l.code IN (SELECT code FROM countries WHERE continent = 'Africa')
--   5. ORDER BY country, language.
--
-- Reminder: CROSS JOIN has no ON clause.
--           Use WHERE on each table separately to limit the combinations.

-- TODO: write your CROSS JOIN query here

SELECT
    c.name      AS country,
    l.name      AS language
FROM countries AS c
CROSS JOIN languages AS l
WHERE c.continent = 'Oceania'
  AND l.code IN (
        SELECT code
        FROM countries
        WHERE continent = 'Africa'
      )
ORDER BY country, language;