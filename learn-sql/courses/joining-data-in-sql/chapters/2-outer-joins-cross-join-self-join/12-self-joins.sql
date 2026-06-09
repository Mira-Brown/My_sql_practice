-- Lesson: Self joins
-- A self join joins a table to itself.
-- You must alias the table twice so SQL can tell the two "copies" apart.
-- Useful for comparing rows within the same table.

-- Example: compare each country's 2010 vs 2015 life expectancy
-- Both p1 and p2 come from the same populations table.

SELECT
    p1.country_code,
    p1.life_expectancy AS life_exp_2010,
    p2.life_expectancy AS life_exp_2015
FROM populations AS p1
INNER JOIN populations AS p2
    ON p1.country_code = p2.country_code
    AND p1.year = 2010
    AND p2.year = 2015
ORDER BY p1.country_code
LIMIT 10;
