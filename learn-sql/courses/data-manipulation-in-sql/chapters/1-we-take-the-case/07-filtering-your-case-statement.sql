-- Exercise: Filtering your CASE statement
-- Objective: Label Barcelona's results in the 2014/2015 season only.
--            Barcelona team_api_id = 8634
--
-- Instructions:
--   1. SELECT m.id, m.season, h.team_long_name AS home_team,
--             a.team_long_name AS away_team, m.home_goal, m.away_goal.
--   2. JOIN team twice (as h and a) on team_api_id.
--   3. Add a CASE expression aliased as barcelona_result that returns:
--        'Win'  when Barcelona scored more goals than the opponent
--               (check both home and away scenarios)
--        'Loss' when Barcelona scored fewer
--        'Draw' otherwise
--   4. Filter with WHERE to only include:
--        - matches from season '2014/2015'
--        - matches where Barcelona appear (home OR away)
--
-- Hint: For the CASE, you need to think about whether Barcelona
--       is the home or away team to know which goal column is "theirs".

SELECT
    m.id, m.season, h.team_long_name AS home_team,
    a.team_long_name AS away_team, m.home_goal, m.away_goal,
    CASE WHEN m.hometeam_id = 8634 AND home_goal > away_goal THEN 'Win'
         WHEN m.awayteam_id = 8634 AND away_goal > home_goal THEN 'Win'   
         WHEN m.hometeam_id = 8634 AND home_goal < away_goal THEN 'Loss'  
         WHEN m.awayteam_id = 8634 AND away_goal < home_goal THEN 'Loss' 
     ELSE 'Draw'
    END AS barcelona_result
FROM match AS m
     JOIN team AS h ON m.hometeam_id = h.team_api_id
     JOIN team AS a ON m.awayteam_id = a.team_api_id
WHERE m.season = '2014/2015'
  AND (m.hometeam_id = 8634 OR m.awayteam_id = 8634) 
;
