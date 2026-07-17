-- Lesson 15: Longest gap
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Compute each consecutive gap with lead()/lag(), then take the max.
--
-- Example — the single longest gap between consecutive requests:
SELECT max(gap) AS longest_gap
FROM (SELECT date_created,
             date_created - lag(date_created) OVER (ORDER BY date_created) AS gap
      FROM evanston311) AS gaps;

-- Exercise: Longest gap
-- Objective: Find the longest gap between consecutive COMPLETED requests.
-- Instructions:
--   1. Subquery: order completed rows by date_completed, compute gap via lag().
--   2. Outer query: max(gap).

-- TODO: write your query below
SELECT max(gap) AS longest_gap
FROM (SELECT date_completed,
             date_completed - lag(date_completed) OVER (ORDER BY date_completed) AS gap
      FROM evanston311
      WHERE date_completed IS NOT NULL) AS gaps;
