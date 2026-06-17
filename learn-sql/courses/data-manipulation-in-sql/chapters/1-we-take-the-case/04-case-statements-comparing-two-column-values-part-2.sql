-- Exercise: CASE statements comparing two column values part 2
-- Objective: Return the name of the winning team (home or away) for each match.
--
-- Instructions:
--   1. SELECT m.id, m.season, m.home_goal, m.away_goal.
--   2. JOIN team twice:
--        - alias team as h, join ON m.hometeam_id = h.team_api_id
--        - alias team as a, join ON m.awayteam_id = a.team_api_id
--   3. Add a CASE expression aliased as winner that returns:
--        h.team_long_name   when home_goal > away_goal
--        a.team_long_name   when away_goal > home_goal
--        'Draw'             otherwise
--   4. No WHERE clause.

SELECT
     m.id, m.season, m.home_goal, m.away_goal,
    CASE WHEN home_goal > away_goal THEN h.team_long_name
         WHEN away_goal > home_goal THEN a.team_long_name
         ELSE 'Draw'
    END AS winner
FROM match AS m
    JOIN team AS h ON m.hometeam_id = h.team_api_id
    JOIN team AS a ON m.awayteam_id = a.team_api_id
;
