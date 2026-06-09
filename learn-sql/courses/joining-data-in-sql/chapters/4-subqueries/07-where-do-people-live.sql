-- Exercise: WHERE do people live?
-- Objective: Find countries whose population size in 2015 was greater than
--            the average population size across all countries in 2015.
-- Instructions:
--   1. SELECT country_code and size from the populations table.
--   2. Alias size as pop_size.
--   3. Filter to year = 2015.
--   4. Use a subquery inside WHERE to filter to only countries whose size
--      is above the average size for 2015.
--   5. ORDER BY pop_size DESC.

-- TODO: Write your query here

SELECT country_code, size AS pop_size
FROM populations
WHERE year = 2015
AND size >(SELECT AVG(size)
           FROM populations
           WHERE year = 2015)
ORDER BY pop_size DESC;           
