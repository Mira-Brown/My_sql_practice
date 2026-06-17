-- Exercise: In CASE of rivalry
-- Objective: Label El Clasico matches (Barcelona vs Real Madrid, either way round).
--            Barcelona team_api_id = 8634, Real Madrid team_api_id = 8633
--
-- Instructions:
--   1. SELECT m.id, m.season, h.team_long_name AS home_team,
--             a.team_long_name AS away_team, m.home_goal, m.away_goal.
--   2. JOIN team twice (as h and a) on team_api_id.
--   3. Add a CASE expression aliased as clasico that returns:
--        'El Clasico'  when Barcelona plays Real Madrid (either team can be home)
--                      Hint: both teams must appear in the match — use AND with OR
--        'Other'       otherwise
--   4. No WHERE clause.

SELECT
    m.id, m.season, h.team_long_name AS home_team,
    a.team_long_name AS away_team, m.home_goal, m.away_goal,
    CASE WHEN (m.hometeam_id = 8634 OR m.awayteam_id = 8634)
         AND (m.hometeam_id = 8633 OR m.awayteam_id = 8633)
THEN 'El Clasico' 
ELSE 'Other'
    END AS clasico
FROM match AS m
    JOIN team AS h ON m.hometeam_id = h.team_api_id
    JOIN team AS a ON m.awayteam_id = a.team_api_id
;
