-- Lesson 15: Add a window function
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Add RANK() to the two-CTE match query
-- Objective: Take the query from lesson 14 and add a window function that
--            ranks each match by home goals within each season.
--
-- Instructions:
--   1. Keep both CTEs (home and away) exactly as in lesson 14.
--   2. In the main SELECT, add all columns from lesson 14 plus:
--      RANK() OVER(PARTITION BY home.season ORDER BY home_goal DESC)
--      aliased as home_goal_rank.
--   3. ORDER BY home.season, home_goal_rank.

-- TODO:
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
       home_goal, away_goal,
       RANK() OVER(PARTITION BY home.season 
       ORDER BY home_goal DESC) AS home_goal_rank
FROM home JOIN away ON home.id = away.id  
ORDER BY home.season, home_goal_rank;