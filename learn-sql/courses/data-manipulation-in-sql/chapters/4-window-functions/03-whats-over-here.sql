-- Lesson 3: What's OVER here?
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: SUM and COUNT with OVER()
-- Objective: Practice using different aggregate functions as window functions
--            to build a richer per-row summary of the 2011/2012 season.
--
-- Instructions:
--   1. Select id, season, home_goal, away_goal from match.
--   2. Add a window function using SUM to get the total home goals
--      scored across all 2011/2012 matches — alias it overall_home.
--   3. Add a window function using SUM to get the total away goals
--      across all 2011/2012 matches — alias it overall_away.
--   4. Add a window function using COUNT on id to get the total number
--      of matches in the season — alias it num_matches.
--   5. Filter to season '2011/2012'.

SELECT
    id,
    season,
    home_goal,
    away_goal,
    SUM(home_goal) OVER() AS overall_home,
    SUM(away_goal) OVER() AS overall_away,
    COUNT(id) OVER() AS num_matches
FROM match
WHERE season = '2011/2012'
