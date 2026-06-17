-- Exercise: Get team names with correlated subqueries
-- Objective: Get the same top-10 result as Lesson 12, but using correlated
--            subqueries in SELECT instead of JOINs.
-- Instructions:
--   1. SELECT from match AS m with these columns:
--        - A correlated subquery AS home:
--            (SELECT team_long_name FROM team WHERE team_api_id = m.hometeam_id)
--        - A correlated subquery AS away:
--            (SELECT team_long_name FROM team WHERE team_api_id = m.awayteam_id)
--        - m.season, m.home_goal, m.away_goal
--   2. ORDER BY (m.home_goal + m.away_goal) DESC
--   3. LIMIT 10

SELECT
    (SELECT team_long_name FROM team WHERE team_api_id = m.hometeam_id) AS home,
    (SELECT team_long_name FROM team WHERE team_api_id = m.awayteam_id) AS away,
    m.season,
    m.home_goal,
    m.away_goal
FROM match AS m
ORDER BY (m.home_goal + m.away_goal) DESC
LIMIT 10;
```