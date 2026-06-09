-- Exercise: Chaining FULL JOINs
-- Objective: Chain two FULL JOINs to combine countries,
--            languages, and currencies in one result set.
--
-- Instructions:
--   1. SELECT c.name AS country, l.name AS language, cu.basic_unit AS currency
--   2. FROM countries AS c
--   3. FULL JOIN languages AS l ON c.code = l.code
--   4. FULL JOIN currencies AS cu ON c.code = cu.code
--   5. WHERE c.continent = 'Oceania'
--
-- Reminder: both joins use c.code as the key.
--           Each FULL JOIN stacks onto the previous result.

-- TODO: write your chained FULL JOIN query here

SELECT
    c.name          AS country,
    l.name          AS language,
    cu.basic_unit   AS currency
FROM countries AS c
FULL JOIN languages AS l
    ON c.code = l.code
FULL JOIN currencies AS cu
    ON c.code = cu.code
WHERE c.continent = 'Oceania';