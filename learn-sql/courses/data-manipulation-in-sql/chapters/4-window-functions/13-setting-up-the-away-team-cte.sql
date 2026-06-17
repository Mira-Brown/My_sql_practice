-- Lesson 13: Setting up the away team CTE
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Build the away team CTE
-- Objective: Mirror the home CTE from lesson 12, but for the away side.
--
-- Instructions:
--   1. Define a CTE called away that selects:
--        m.id, m.season,
--        t.team_long_name aliased as away_team,
--        m.away_goal
--      from match AS m joined to team AS t on m.awayteam_id = t.team_api_id.
--   2. In the main SELECT, retrieve all four columns from away.
--   3. Filter to season '2011/2012'.
--   4. ORDER BY away_team, id.

WITH away AS (
    SELECT m.id, m.season,
           t.team_long_name AS away_team,
           m.away_goal
    FROM match AS m
    JOIN team AS t ON m.awayteam_id = t.team_api_id
)
SELECT id, season, away_team, away_goal
FROM away
WHERE season = '2011/2012'
ORDER BY away_team, id;