-- Exercise: Nest a subquery in FROM
-- Objective: Use a nested subquery in FROM to produce a summary table showing
--            each country's average goals per match per season, then query that summary.
-- Instructions:
--   1. Write an inner subquery that computes:
--        country_id, season, AVG(home_goal + away_goal) AS avg_goals
--      FROM match, grouped by country_id and season — alias it AS match_stats
--   2. In the outer query, SELECT country_id, season, avg_goals FROM match_stats
--   3. ORDER BY country_id, season

SELECT
    country_id,
    season,
    avg_goals
FROM (
    SELECT country_id,
    season,
    AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY country_id, season
) AS match_stats
ORDER BY country_id, season;
