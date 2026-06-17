-- Lesson 5: OVER with a PARTITION
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db

-- PARTITION BY splits the window into sub-windows — one per unique value of
-- the partition column. The aggregate resets and recalculates for each group,
-- but rows are still NOT collapsed.

-- Example: average home goals, calculated separately per season
SELECT
    season,
    home_goal,
    away_goal,
    AVG(home_goal) OVER(PARTITION BY season) AS avg_home_by_season
FROM match
ORDER BY season
LIMIT 12;

-- Results (first 12 rows):
-- season     | home_goal | away_goal | avg_home_by_season
-- 2011/2012  |     2     |     1     |  1.573   ← 2011/2012 average
-- 2011/2012  |     1     |     1     |  1.573
-- ...
-- 2012/2013  |     1     |     0     |  1.550   ← resets for 2012/2013
-- 2012/2013  |     2     |     1     |  1.550
--
-- Each season's average: 2011/2012=1.573, 2012/2013=1.550,
--                        2013/2014=1.579, 2014/2015=1.520
--
-- Compare to OVER() with no partition: that gives ONE global average (1.565)
-- applied to every row regardless of season.
-- PARTITION BY season gives FOUR averages — one per season — applied to the
-- correct rows, while still keeping every match row intact.
