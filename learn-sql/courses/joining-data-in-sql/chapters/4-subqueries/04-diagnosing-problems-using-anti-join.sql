 -- Exercise: Diagnosing problems using anti join
-- Objective: Use an anti join to find currencies used by Oceanian countries
--            that are NOT in the economies table.
-- Instructions:
--   1. SELECT code and name from the countries table.
--   2. Filter to only countries in the continent 'Oceania'.
--   3. Add a second WHERE condition using NOT IN so that only countries
--      whose code does NOT appear in the economies table are returned.
--   4. ORDER BY code ascending.

-- TODO: Write your anti join here

SELECT code , name
FROM countries
WHERE code NOT IN (SELECT code FROM economies) 
AND continent = 'Oceania'
ORDER BY code ASC;