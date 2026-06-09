-- Exercise: Comparing a country to itself
-- Objective: Use a self join on populations to compare each country's
--            fertility rate in 2010 vs 2015 side by side.
--
-- Instructions:
--   1. SELECT p1.country_code,
--             p1.fertility_rate AS fertility_2010,
--             p2.fertility_rate AS fertility_2015
--   2. FROM populations AS p1
--   3. INNER JOIN populations AS p2
--         ON p1.country_code = p2.country_code
--         AND p1.year = 2010
--         AND p2.year = 2015
--   4. ORDER BY p1.country_code.
--
-- Reminder: alias the same table twice (p1 and p2).
--           Match on country_code, then pin each copy to its year in ON.

-- TODO: write your self join here
SELECT
    p1.country_code,
    p1.fertility_rate   AS fertility_2010,
    p2.fertility_rate   AS fertility_2015
FROM populations AS p1
INNER JOIN populations AS p2
    ON p1.country_code = p2.country_code
    AND p1.year = 2010
    AND p2.year = 2015
ORDER BY p1.country_code;