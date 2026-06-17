-- Lesson 5: Subqueries in FROM
-- Type: Video ▶ (50 XP)
--
-- A subquery in FROM acts as a temporary table.
-- Every FROM subquery MUST have an alias.
--
-- Example: average goals per season (inner), then filter by that average (outer)

SELECT season, avg_goals
FROM (
    SELECT season, AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY season
) AS season_avgs
WHERE avg_goals > 2.75;

-- All four seasons and their averages (remove the outer WHERE to see):
-- 2011/2012 | 2.72
-- 2012/2013 | 2.77
-- 2013/2014 | 2.77
-- 2014/2015 | 2.68
-- Only the middle two seasons clear the 2.75 threshold.
