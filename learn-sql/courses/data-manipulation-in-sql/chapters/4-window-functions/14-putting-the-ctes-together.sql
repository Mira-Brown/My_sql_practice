-- Lesson 14: Putting the CTEs together
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Join home and away CTEs into a full match view
-- Objective: Define both CTEs, then join them on match id to produce
--            one row per match with both team names and both goal counts.
--
-- Instructions:
--   1. Define the home CTE (id, season, home_team, home_goal).
--   2. Define the away CTE (id, season, away_team, away_goal).
--   3. SELECT home.id, home.season, home_team, away_team,
--             home_goal, away_goal
--      FROM home JOIN away ON home.id = away.id.
--   4. ORDER BY home.id.

WITH home AS (
    SELECT m.id, m.season,
           t.team_long_name AS home_team,
           m.home_goal 
           FROM match AS m 
           JOIN team AS t ON m.hometeam_id = t.team_api_id),
     away AS (
    SELECT m.id, m.season,
           t.team_long_name AS away_team,
           m.away_goal    
    FROM match AS m
    JOIN team AS t ON m.awayteam_id = t.team_api_id )
SELECT home.id, home.season,
       home_team, away_team,
       home_goal, away_goal
       FROM home JOIN away ON home.id = away.id
ORDER BY home.id;
