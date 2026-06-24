-- Lesson 5: Frames
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)

-- KEY IDEA: A frame defines exactly which rows within the current partition
-- are included in a window function's calculation.
-- By default (when ORDER BY is present): RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- You override this with a ROWS BETWEEN clause.

-- Frame syntax:
--   ROWS BETWEEN <start> AND <end>
--
--   Keywords:
--     UNBOUNDED PRECEDING  — from the very first row of the partition
--     N PRECEDING          — N rows before the current row
--     CURRENT ROW          — the current row itself
--     N FOLLOWING          — N rows after the current row
--     UNBOUNDED FOLLOWING  — to the very last row of the partition

-- Example 1 — default (all preceding rows, i.e. running total):
--   SUM(medals) OVER (ORDER BY year
--                     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)

-- Example 2 — 3-year moving average (current + 2 preceding):
--   AVG(medals) OVER (ORDER BY year
--                     ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

-- Run this to see the difference between running total and a 3-row moving max:
WITH cte AS (
    SELECT country, year, COUNT(*) AS medals
    FROM summer_medals
    WHERE medal = 'Gold' AND country = 'GBR'
    GROUP BY country, year
)
SELECT year, medals,
       MAX(medals) OVER (ORDER BY year
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_max,
       MAX(medals) OVER (ORDER BY year
                         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)        AS moving_max_3
FROM cte
ORDER BY year;
