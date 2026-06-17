-- Lesson 1: It's OVER
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db

-- Window functions let you run an aggregate (SUM, AVG, COUNT, RANK…) across a
-- set of rows that are *related to the current row* — without collapsing them
-- into a single output row the way GROUP BY does.
--
-- The key syntax is:
--   <aggregate>(<col>) OVER([PARTITION BY ...] [ORDER BY ...] [frame])
--
-- The simplest form uses an empty OVER() — the window is the entire result set.

-- Example: each match row side-by-side with the season average home goals
SELECT
    id,
    season,
    home_goal,
    away_goal,
    AVG(home_goal) OVER() AS avg_home_goal
FROM match
WHERE season = '2011/2012'
LIMIT 10;

-- Run this query and notice:
--   • Every row keeps its own home_goal value.
--   • avg_home_goal is the *same* on every row (~1.57) — it's the season-wide
--     average, computed once across the window, not per group.
--   • Compare: GROUP BY season would give you ONE row per season with AVG,
--     losing all the match-level detail.  OVER() gives you BOTH.
