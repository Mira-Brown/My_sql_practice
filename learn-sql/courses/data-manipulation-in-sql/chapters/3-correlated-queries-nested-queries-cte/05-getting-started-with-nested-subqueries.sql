-- Exercise: Getting started with nested subqueries
-- Objective: Use a nested subquery to find matches with above-average total goals,
--            where "average" is itself computed from per-season averages.
-- Instructions:
--   1. The outer query selects id, season, home_goal, away_goal FROM match
--   2. Filter WHERE (home_goal + away_goal) exceeds the result of a subquery
--   3. That subquery computes AVG(season_goals) from an inner subquery
--   4. The inner subquery computes AVG(home_goal + away_goal) AS season_goals
--      FROM match, grouped by season — alias it AS season_avgs

SELECT
    id,
    season,
    home_goal,
    away_goal
FROM match
WHERE (home_goal + away_goal) > (
    SELECT AVG(season_goals)
    FROM (
        SELECT AVG(home_goal + away_goal) AS season_goals
        FROM match
        GROUP BY season)
      AS season_avgs
);
