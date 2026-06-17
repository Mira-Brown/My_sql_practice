-- Lesson 9: Slide to the left
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Running totals with a backward-looking sliding window
-- Objective: Use ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW to build
--            a running total of home goals across matchdays in the England
--            2011/2012 season.
--
-- Worked example (Scotland, 2012/2013):
--   SELECT m.stage,
--          SUM(m.home_goal) AS goals,
--          SUM(SUM(m.home_goal)) OVER(
--              ORDER BY m.stage
--              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--          ) AS running_total
--   FROM match AS m
--   JOIN country AS c ON m.country_id = c.id
--   WHERE m.season = '2012/2013' AND c.name = 'Scotland'
--   GROUP BY m.stage
--   ORDER BY m.stage;
--
-- Instructions:
--   1. SELECT m.stage, SUM(m.home_goal) aliased as goals, and a
--      running total of SUM(m.home_goal) aliased as running_total.
--   2. The running total window: ORDER BY m.stage,
--      frame ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
--   3. FROM match AS m, JOIN country AS c ON m.country_id = c.id.
--   4. Filter to season '2011/2012' and country 'England'.
--   5. GROUP BY m.stage, ORDER BY m.stage.

SELECT
    m.stage,
    SUM(m.home_goal) AS goals,
    SUM(SUM(m.home_goal)) OVER (ORDER BY m.stage 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    AS running_total
FROM match AS m
JOIN country AS c ON m.country_id = c.id 
WHERE c.name = 'England' AND season = '2011/2012'
GROUP BY m.stage
ORDER BY m.stage;
