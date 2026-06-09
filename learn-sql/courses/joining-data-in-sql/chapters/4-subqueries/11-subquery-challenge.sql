-- Exercise: Subquery challenge
-- Objective: Find the top 5 most densely populated countries in 2015
--            (population size divided by surface area).
-- Instructions:
--   1. Write an inner query that SELECTs country_code and
--      size / surface_area AS pop_density, by JOINing populations and
--      countries on populations.country_code = countries.code,
--      filtering to year = 2015.
--   2. Wrap it as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT country_code and pop_density from subq.
--   4. ORDER BY pop_density DESC.
--   5. LIMIT to 5 rows.

-- TODO: Write your query here

SELECT country_code, pop_density
FROM (
    SELECT populations.country_code, 
    populations.size / countries.surface_area AS pop_density
    FROM populations
    JOIN countries ON populations.country_code = countries.code
    WHERE populations.year = 2015
) AS subq
ORDER BY pop_density DESC
LIMIT 5;