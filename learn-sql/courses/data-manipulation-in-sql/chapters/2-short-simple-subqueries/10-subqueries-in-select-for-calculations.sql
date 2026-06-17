-- Exercise: Subqueries in Select for Calculations
-- Objective: Use a SELECT subquery to compute a difference column.
--
-- Instructions:
--   1. Select country_id and AVG(home_goal + away_goal) AS avg_goals from match,
--      grouped by country_id.
--   2. Add a third column: the difference between each country's avg_goals
--      and the overall average across all matches.
--      Calculate it as:
--        AVG(home_goal + away_goal) - (SELECT AVG(home_goal + away_goal) FROM match)
--      Alias it AS diff.
--   3. Order by diff DESC so the highest-scoring leagues appear first.

SELECT
    country_id,
    AVG(home_goal + away_goal) AS avg_goals,
AVG(home_goal + away_goal) - (SELECT AVG(home_goal + away_goal) FROM match) AS diff
FROM match
GROUP BY country_id
ORDER BY diff DESC;
