-- Lesson 5: Summarize group statistics
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- GROUP BY computes a summary statistic separately for each group. You can pick
-- the max/min within groups, then aggregate again in an outer query.
--
-- Example — the largest single company (by employees) in each sector:
SELECT sector, max(employees) AS biggest
FROM fortune500
GROUP BY sector
ORDER BY biggest DESC;

-- Exercise: Summarize group statistics
-- Objective: For each sector, find the min and max of profits_change.
-- Instructions:
--   1. Group fortune500 by sector.
--   2. Return sector, min(profits_change), max(profits_change).
--   3. Order by max descending.

-- TODO: write your query below
SELECT sector,
       min(profits_change) AS min_change,
       max(profits_change) AS max_change
FROM fortune500
GROUP BY sector
ORDER BY max_change DESC;
