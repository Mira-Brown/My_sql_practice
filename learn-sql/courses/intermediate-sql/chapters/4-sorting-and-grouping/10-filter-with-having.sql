-- Exercise: Filter with HAVING
-- Objective: Use HAVING to filter results after grouping.
--
-- Instructions:
--   1. Find languages where the average film duration exceeds 120 minutes.
--      Select language and AVG(duration) aliased as avg_duration.
--      Order by avg_duration DESC.
--
--   2. Find certifications where the total gross exceeds 1 billion (1000000000).
--      Select certification and SUM(gross) aliased as total_gross.
--      Order by total_gross DESC.

-- Query 1
-- TODO: write your query here
SELECT language, AVG(duration) AS avg_duration
FROM films
GROUP BY language
HAVING AVG(duration) > 120
ORDER BY avg_duration DESC;

-- Query 2
-- TODO: write your query here
SELECT certification, SUM(gross) AS total_gross
FROM films
-- WHERE gross > 1000000000
GROUP BY certification
HAVING SUM(gross) > 1000000000
ORDER BY total_gross DESC;