-- Lesson 12: Setting up the home team CTE
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Build the home team CTE
-- Objective: Create a CTE that joins match to team on the home side,
--            then SELECT from it to verify it works.
--
-- Instructions:
--   1. Define a CTE called home that selects:
--        m.id, m.season,
--        t.team_long_name aliased as home_team,
--        m.home_goal
--      from match AS m joined to team AS t on m.hometeam_id = t.team_api_id.
--   2. In the main SELECT, retrieve all four columns from home.
--   3. Filter to season '2011/2012'.
--   4. ORDER BY home_team, id.

-- TODO: define home CTE
WITH home AS (
    SELECT m.id, m.season,
           t.team_long_name AS home_team,
           m.home_goal
    FROM match AS m
    JOIN team AS t ON m.hometeam_id = t.team_api_id
)

-- TODO: SELECT from home, filter to 2011/2012, order by home_team, id
SELECT id, season, home_team, home_goal
FROM home
WHERE season = '2011/2012'
ORDER BY home_team, id;
