-- Exercise: Get team names with a subquery
-- Objective: Use a subquery in FROM to attach home and away team names to each match.
-- Instructions:
--   1. Write an inner subquery that joins match to team TWICE:
--        - JOIN team AS h ON m.hometeam_id = h.team_api_id
--        - JOIN team AS a ON m.awayteam_id = a.team_api_id
--      SELECT m.id, m.season, h.team_long_name AS home, a.team_long_name AS away,
--             m.home_goal, m.away_goal
--      Alias the subquery AS matches
--   2. In the outer query, SELECT home, away, season, home_goal, away_goal
--      FROM matches
--   3. ORDER BY (home_goal + away_goal) DESC
--   4. LIMIT 10

SELECT
    home,
    away,
    season,
    home_goal,
    away_goal
FROM(
    SELECT m.id, m.season, 
           h.team_long_name AS home, 
           a.team_long_name AS away,
           m.home_goal, m.away_goal
    FROM match AS m
    JOIN team AS h
    ON m.hometeam_id = h.team_api_id
    JOIN team AS a
    ON m.awayteam_id = a.team_api_id
) AS matches
ORDER BY (home_goal + away_goal) DESC
LIMIT 10;
