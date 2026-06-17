-- Lesson 10: Slide to the right
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Forward-looking running total with a sliding window
-- Objective: Use ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING to calculate
--            the total home goals remaining from each matchday to end of season.
--
-- Instructions:
--   1. SELECT m.stage, SUM(m.home_goal) AS goals, and a
--      forward-looking running total aliased as future_total.
--   2. Frame: ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING,
--      ordered by m.stage.
--   3. FROM match AS m, JOIN country AS c ON m.country_id = c.id.
--   4. Filter to c.name = 'Spain' AND m.season = '2012/2013'.
--   5. GROUP BY m.stage, ORDER BY m.stage.

SELECT
    m.stage,
    SUM(m.home_goal) AS goals,
    SUM(SUM(m.home_goal)) OVER (ORDER BY m.stage 
    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
    AS future_total
FROM match AS m
JOIN country AS c ON m.country_id = c.id
WHERE c.name = 'Spain' AND season = '2012/2013'
GROUP BY m.stage
ORDER BY m.stage;
