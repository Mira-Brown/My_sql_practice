-- Exercise: CTEs with nested subqueries
-- Objective: Combine a CTE with a nested subquery inside it.
--            Identify seasons where the average total goals exceeded
--            the average of all per-season averages.
-- Instructions:
--   1. Define a CTE called season_goals:
--        SELECT season, AVG(home_goal + away_goal) AS avg_goals
--        FROM match GROUP BY season
--   2. In the main query, SELECT season, avg_goals FROM season_goals
--   3. Filter WHERE avg_goals > a nested subquery:
--        (SELECT AVG(avg_goals) FROM season_goals)
--   4. ORDER BY avg_goals DESC

-- TODO: write the CTE and main query below

WITH season_goals AS (
    SELECT season, AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY season
)
SELECT season, avg_goals
FROM season_goals
WHERE avg_goals > (SELECT AVG(avg_goals) FROM season_goals)
ORDER BY avg_goals DESC;

