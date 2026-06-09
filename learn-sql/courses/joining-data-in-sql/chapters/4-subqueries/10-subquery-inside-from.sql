-- Exercise: Subquery inside FROM
-- Objective: For each continent, find the maximum inflation rate in 2015,
--            then return only continents where that max is below 10%.
-- Instructions:
--   1. Write an inner query that SELECTs continent and MAX(inflation_rate)
--      aliased as max_inf, by JOINing countries and economies on code,
--      filtering to year = 2015, and grouping by continent.
--   2. Wrap that as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT continent and max_inf from subq.
--   4. Filter the outer query to only rows WHERE max_inf < 10.
--   5. ORDER BY max_inf ASC.

-- TODO: Write your query here
SELECT continent, max_inf
FROM (
    SELECT c.continent, MAX(e.inflation_rate) AS max_inf
    FROM countries AS c
    JOIN economies AS e ON c.code = e.code
    WHERE e.year = 2015
    GROUP BY c.continent
) AS subq
WHERE max_inf < 10
ORDER BY max_inf ASC;

