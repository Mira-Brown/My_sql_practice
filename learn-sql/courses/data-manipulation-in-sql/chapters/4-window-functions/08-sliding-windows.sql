-- Lesson 8: Sliding windows
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db

-- A sliding window adds a FRAME CLAUSE to OVER() that controls exactly which
-- rows are included in the calculation relative to the current row.
-- Syntax: ROWS BETWEEN <start> AND <end>
--
-- Key frame boundary keywords:
--   UNBOUNDED PRECEDING  — from the very first row of the window
--   N PRECEDING          — N rows before the current row
--   CURRENT ROW          — the current row itself
--   N FOLLOWING          — N rows after the current row
--   UNBOUNDED FOLLOWING  — to the very last row of the window
--
-- Example: running total of home goals by matchday in 2011/2012

SELECT
    stage,
    SUM(home_goal) AS stage_goals,
    SUM(SUM(home_goal)) OVER(
        ORDER BY stage
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM match
WHERE season = '2011/2012'
GROUP BY stage
ORDER BY stage
LIMIT 8;

-- Results:
-- stage | stage_goals | running_total
--   1   |    120      |    120   ← just stage 1
--   2   |    151      |    271   ← stages 1+2
--   3   |    142      |    413   ← stages 1+2+3
--   4   |    162      |    575
--   5   |    137      |    712
--   ...
--
-- UNBOUNDED PRECEDING AND CURRENT ROW = "everything so far"
-- The running total grows with each matchday.
-- Change UNBOUNDED PRECEDING to 1 PRECEDING and you get a rolling 2-stage window.
