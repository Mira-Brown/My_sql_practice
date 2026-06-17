-- Exercise: Get team names with CTEs
-- Objective: Get the same top-10 result as Lessons 12 & 13, using two CTEs
--            to pre-build home and away team name lookups.
-- Instructions:
--   1. Define CTE home_teams:
--        SELECT m.id, t.team_long_name AS home
--        FROM match AS m
--        JOIN team AS t ON m.hometeam_id = t.team_api_id
--   2. Define CTE away_teams:
--        SELECT m.id, t.team_long_name AS away
--        FROM match AS m
--        JOIN team AS t ON m.awayteam_id = t.team_api_id
--   3. Main query:
--        SELECT h.home, a.away, m.season, m.home_goal, m.away_goal
--        FROM match AS m
--        JOIN home_teams AS h ON m.id = h.id
--        JOIN away_teams AS a ON m.id = a.id
--        ORDER BY (m.home_goal + m.away_goal) DESC
--        LIMIT 10

-- TODO: write the two CTEs and main query below

 WITH home_teams AS (
    SELECT m.id, t.team_long_name AS home
    FROM match AS m
    JOIN team AS t ON m.hometeam_id = t.team_api_id
),
away_teams AS (
    SELECT m.id, t.team_long_name AS away
    FROM match AS m
    JOIN team AS t ON m.awayteam_id = t.team_api_id
)

SELECT h.home, a.away, m.season, m.home_goal, m.away_goal
FROM match AS m
JOIN home_teams AS h ON m.id = h.id
JOIN away_teams AS a ON m.id = a.id
ORDER BY (m.home_goal + m.away_goal) DESC
LIMIT 10;