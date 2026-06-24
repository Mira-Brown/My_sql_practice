-- Exercise: Cleaning up results
-- Objective: Use COALESCE to replace NULLs in a ROLLUP result with meaningful labels.
--
-- Instructions:
--   1. SELECT three columns:
--        - COALESCE(country, 'All countries') AS country
--        - COALESCE(medal, 'All medals') AS medal
--        - COUNT(*) AS awards
--   2. FROM summer_medals
--   3. Filter to year = 2012 only.
--   4. GROUP BY ROLLUP(country, medal)
--   5. ORDER BY country ASC, medal ASC.

-- TODO: write your query here
SELECT  COALESCE(country, 'All countries') AS country,
        COALESCE(medal, 'All medals') AS medal,
        COUNT(*) AS awards
FROM summer_medals
WHERE year = 2012
GROUP BY ROLLUP(country, medal)
ORDER BY country ASC, medal ASC;        