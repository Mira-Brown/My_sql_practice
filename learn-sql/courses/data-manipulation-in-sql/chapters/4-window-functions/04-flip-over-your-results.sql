-- Lesson 4: Flip OVER your results
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Ranking matches with RANK() OVER(ORDER BY ...)
-- Objective: Use RANK() as a window function to rank 2011/2012 matches
--            by the number of home goals scored, highest first.
--
-- So far OVER() used an empty window — every row got the same aggregate.
-- Adding ORDER BY inside OVER() changes this: each row gets a value
-- based on its position in that ordering.
--
-- RANK() assigns 1 to the highest value, 2 to the next, etc.
-- Ties share the same rank (and the next rank is skipped).
--
-- Instructions:
--   1. Select id, season, home_goal, and away_goal from match.
--   2. Add RANK() OVER(ORDER BY home_goal DESC) aliased as home_goal_rank.
--   3. Filter to season '2011/2012'.
--   4. ORDER the final results by home_goal_rank ASC so the
--      highest-scoring home games appear first.

SELECT
    id,
    season,
    home_goal,
    away_goal,
    RANK() OVER(ORDER BY home_goal DESC) AS home_goal_rank
FROM match
WHERE season = '2011/2012'
ORDER BY home_goal_rank ASC;
