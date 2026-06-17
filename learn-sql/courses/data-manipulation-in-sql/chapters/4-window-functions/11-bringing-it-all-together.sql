-- Lesson 11: Bringing it all together
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db

-- The next 4 exercises build one complete analysis in stages:
--   12. CTE for home team matches + goals
--   13. CTE for away team matches + goals
--   14. Join both CTEs into a unified match view
--   15. Add a window function to rank teams by season performance
--
-- The payoff: a query that shows every match with both team names,
-- goals scored, and each team's season ranking — all without subquery clutter.
--
-- Preview: CTEs + PARTITION BY in one query

WITH home AS (
    SELECT m.id, m.season,
           t.team_long_name AS home_team,
           m.home_goal
    FROM match AS m
    JOIN team AS t ON m.hometeam_id = t.team_api_id
)
SELECT
    home_team,
    season,
    home_goal,
    AVG(home_goal) OVER(PARTITION BY home_team) AS avg_home
FROM home
WHERE season = '2011/2012'
ORDER BY home_team
LIMIT 8;

-- Each team gets its own per-team average alongside every match row.
-- Lessons 12-15 build toward the full version of this pattern.
