-- Lesson 3: Date comparisons
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Compare timestamps with < <= > >=. Prefer a half-open range
-- (>= start AND < end) over BETWEEN, which INCLUDES the end and can double-count
-- the boundary instant.
--
-- Example — requests completed the same day they were created:
SELECT count(*)
FROM evanston311
WHERE date_completed::date = date_created::date;

-- Exercise: Date comparisons
-- Objective: Count requests created in February 2017 that were still not
--            completed by the end of that month.
-- Instructions:
--   1. Created in Feb 2017 (>= '2017-02-01' AND < '2017-03-01').
--   2. AND (date_completed IS NULL OR date_completed >= '2017-03-01').

-- TODO: write your query below
SELECT count(*) AS open_at_month_end
FROM evanston311
WHERE date_created >= '2017-02-01'
  AND date_created <  '2017-03-01'
  AND (date_completed IS NULL OR date_completed >= '2017-03-01');
