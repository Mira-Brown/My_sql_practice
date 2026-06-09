-- Exercise: Subquery inside WHERE
-- Objective: Find countries with a fertility rate higher than the average
--            fertility rate in 2015.
-- Instructions:
--   1. SELECT country_code and fertility_rate from the populations table.
--   2. Filter to year = 2015.
--   3. Add a WHERE condition so only rows where fertility_rate is greater than
--      the average fertility_rate for 2015 are returned.
--      Use a subquery inside WHERE to calculate that average.
--   4. ORDER BY fertility_rate DESC.

-- TODO: Write your query here

SELECT country_code, fertility_rate
FROM populations
WHERE year = 2015 
AND fertility_rate > (SELECT AVG(fertility_rate)
                      FROM populations
                      WHERE year = 2015)
ORDER BY fertility_rate DESC;