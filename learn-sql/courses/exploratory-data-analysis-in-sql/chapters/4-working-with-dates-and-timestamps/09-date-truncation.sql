-- Lesson 9: Date truncation
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- date_trunc('unit', ts) rounds a timestamp DOWN to the start of the unit
-- ('day','week','month','year'), returning a timestamp — ideal for time series.
--
-- Example — requests per month as real dates:
SELECT date_trunc('month', date_created) AS month, count(*)
FROM evanston311
GROUP BY month
ORDER BY month;

-- Exercise: Date truncation
-- Objective: Count requests per WEEK across the whole dataset.
-- Instructions:
--   1. date_trunc('week', date_created) as week.
--   2. count(*) per week.
--   3. Order by week.

-- TODO: write your query below
SELECT date_trunc('week', date_created) AS week, count(*) AS n
FROM evanston311
GROUP BY date_trunc('week', date_created)
ORDER BY week;
