-- Exercise: Remembering what is LEFT
-- Objective: Use LEFT JOIN to return all countries alongside their
--            president (if one exists in the presidents table).
--
-- Instructions:
--   1. SELECT the country name from the countries table and the president
--      column from the presidents table.
--   2. Alias countries as c and presidents as p.
--   3. LEFT JOIN presidents onto countries matching on c.name = p.country.
--   4. Return all rows — no WHERE filter needed.

-- TODO: write your LEFT JOIN query here
SELECT c.name AS country, p.president
FROM countries AS c
LEFT JOIN presidents
     ON c.name = p.president;     
 