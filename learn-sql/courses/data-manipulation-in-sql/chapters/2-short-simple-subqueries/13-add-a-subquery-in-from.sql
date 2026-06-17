-- Exercise: Add a subquery in FROM
-- Objective: Use a FROM subquery to get per-season stats, then filter on them.
--
-- Instructions:
--   1. Write a subquery in FROM that calculates per season:
--        - COUNT(*) AS total_matches
--        - SUM(home_goal) AS total_home_goals
--        - SUM(away_goal) AS total_away_goals
--      from match, grouped by season. Alias it AS season_stats.
--   2. Select season_stats.season, season_stats.total_matches,
--      season_stats.total_home_goals, season_stats.total_away_goals.
--   3. Filter to seasons where total_home_goals > total_away_goals.
--   4. Order by season ASC.

SELECT
    season_stats.season, total_matches, total_home_goals, total_away_goals
FROM (
    SELECT season, COUNT(*) AS total_matches, 
    SUM(home_goal) AS total_home_goals, 
    SUM(away_goal) AS total_away_goals
    FROM match
    GROUP BY season
) AS season_stats
WHERE total_home_goals > total_away_goals
ORDER BY season ASC;
