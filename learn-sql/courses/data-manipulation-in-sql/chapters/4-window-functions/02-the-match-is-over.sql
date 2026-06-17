-- Lesson 2: The match is OVER
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Season-wide goal averages with OVER()
-- Objective: Use window functions to attach season-wide goal averages
--            to every individual match row.
--
-- Instructions:
--   1. Select id, season, home_goal, and away_goal from match.
--   2. Add a window function that calculates the overall average
--      of home_goal across all rows — alias it avg_home.
--   3. Add a second window function that calculates the overall average
--      of away_goal across all rows — alias it avg_away.
--   4. Filter to the season '2011/2012'.

SELECT
    id,
    season,
    home_goal,
    away_goal,
    AVG(home_goal) OVER() AS avg_home,
    AVG(away_goal) OVER() AS avg_way
FROM match
WHERE season = '2011/2012';
