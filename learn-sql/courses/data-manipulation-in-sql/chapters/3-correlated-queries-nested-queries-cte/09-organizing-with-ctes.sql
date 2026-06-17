-- Exercise: Organizing with CTEs
-- Objective: Use TWO CTEs to organize a multi-step query — one for home team
--            stats and one for away team stats — then join them in the main query.
-- Instructions:
--   1. Define CTE home_goals:
--        SELECT hometeam_id, AVG(home_goal) AS avg_home
--        FROM match GROUP BY hometeam_id
--   2. Define CTE away_goals:
--        SELECT awayteam_id, AVG(away_goal) AS avg_away
--        FROM match GROUP BY awayteam_id
--   3. In the main query:
--        SELECT t.team_long_name, h.avg_home, a.avg_away
--        FROM team AS t
--        JOIN home_goals AS h ON t.team_api_id = h.hometeam_id
--        JOIN away_goals AS a ON t.team_api_id = a.awayteam_id
--        ORDER BY t.team_long_name

-- TODO: write the two CTEs and main query below
-- Remember: separate multiple CTEs with a comma inside the WITH block

WITH
home_goals AS (
    SELECT hometeam_id, AVG(home_goal) AS avg_home
    FROM match
    GROUP BY hometeam_id
),
away_goals AS (
    SELECT awayteam_id, AVG(away_goal) AS avg_away
    FROM match
    GROUP BY awayteam_id
)

SELECT t.team_long_name, h.avg_home, a.avg_away
FROM team AS t
JOIN home_goals AS h ON t.team_api_id = h.hometeam_id
JOIN away_goals AS a ON t.team_api_id = a.awayteam_id
ORDER BY t.team_long_name;