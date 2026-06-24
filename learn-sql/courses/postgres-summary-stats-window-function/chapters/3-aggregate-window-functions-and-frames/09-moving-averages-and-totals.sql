-- Lesson 9: Moving averages and totals
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)

-- KEY IDEA: Moving averages and moving totals smooth out year-to-year
-- noise by aggregating over a sliding window of N rows.
-- They answer: "What's the trend over the last N periods?"

-- Moving average — AVG over a frame:
--   AVG(medals) OVER (ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
--   Each row's value = average of itself + 2 rows before it (3-year moving avg).

-- Moving total — SUM over a bounded frame (NOT unbounded):
--   SUM(medals) OVER (ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
--   Differs from a running total: it doesn't keep growing indefinitely.
--   Once outside the window, old values are dropped.

-- ROWS vs RANGE (important distinction):
--   ROWS BETWEEN ... counts physical rows.
--   RANGE BETWEEN ... counts rows with the same ORDER BY value as one unit.
--   For moving averages, always use ROWS — avoids unexpected grouping on ties.

-- Run this to compare a running total vs a 3-year moving total for USA golds:
WITH usa AS (
    SELECT year, COUNT(*) AS medals
    FROM summer_medals
    WHERE medal = 'Gold' AND country = 'USA'
    GROUP BY year
)
SELECT year, medals,
       SUM(medals) OVER (ORDER BY year
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
       SUM(medals) OVER (ORDER BY year
                         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)         AS moving_total_3,
       ROUND(AVG(medals) OVER (ORDER BY year
                         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)     AS moving_avg_3
FROM usa
ORDER BY year;
