-- Exercise: Basic CASE statements
-- Objective: Use CASE to label each match with its outcome from the home team's perspective.
--
-- Instructions:
--   1. SELECT the match id, country_id, season, home_goal, and away_goal columns.
--   2. Add a CASE expression that returns:
--        'Home win'  when home_goal > away_goal
--        'Away win'  when home_goal < away_goal
--        'Draw'      otherwise
--   3. Alias the CASE result as outcome.
--   4. No WHERE clause — return all rows.

SELECT
     id, country_id, season, home_goal, away_goal,
     CASE WHEN  home_goal > away_goal THEN 'Home win'
          WHEN  home_goal < away_goal THEN 'Away win'
          ELSE 'Draw' 
     END AS outcome
FROM match;

-- Exercise: CASE statements comparing column values
-- Objective: Identify matches where the home team scored 3+ more goals than the away team.
--
-- Instructions:
--   1. SELECT the match id and season.
--   2. Add a CASE expression aliased as home_performance that returns:
--        'Dominant'   when home_goal >= away_goal + 3   (home scored 3+ more)
--        'Won'        when home_goal > away_goal         (home won by less)
--        'Draw'       when home_goal = away_goal
--        'Lost'       otherwise
--   3. No WHERE clause — return all rows.

SELECT
     id, season,
     CASE WHEN home_goal >= away_goal + 3 THEN 'Dominant'
          WHEN home_goal > away_goal THEN 'Won'
          WHEN home_goal = away_goal THEN 'Draw'
          ELSE 'Lost'
     END AS home_performance
FROM match;

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



