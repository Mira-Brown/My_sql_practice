-- Exercise: Comparing joins
-- Objective: Use a FULL JOIN to return all countries and their
--            corresponding president (if any), then observe the gaps.
--
-- Instructions:
--   1. SELECT c.name AS country, p.president
--   2. FROM countries AS c
--   3. FULL JOIN presidents AS p ON c.name = p.country
--   4. WHERE p.continent = 'Asia'
--      OR c.continent = 'Asia'
--   5. ORDER BY p.continent.
--
-- Note: the WHERE clause uses OR so rows with NULL on either side
--       still qualify if the non-NULL side matches 'Asia'.

-- TODO: write your FULL JOIN query here

sql
SELECT
    c.name      AS country,
    p.president
FROM countries AS c
FULL JOIN presidents AS p
    ON c.name = p.country
WHERE p.continent = 'Asia'
   OR c.continent = 'Asia'
ORDER BY p.continent;