-- Lesson 4: Date arithmetic
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Subtracting timestamps returns an interval; add/subtract intervals to shift a
-- time. now() - date_created gives elapsed time.
--
-- Example — average time a request stays open:
SELECT avg(date_completed - date_created) AS avg_open_time
FROM evanston311
WHERE date_completed IS NOT NULL;

-- Exercise: Date arithmetic
-- Objective: For completed requests, return id and how many days each took to
--            complete, for the 10 slowest.
-- Instructions:
--   1. date_completed - date_created as the duration (an interval).
--   2. Filter to completed rows.
--   3. Order by the duration descending, limit 10.

-- TODO: write your query below
SELECT id, date_completed - date_created AS time_to_complete
FROM evanston311
WHERE date_completed IS NOT NULL
ORDER BY time_to_complete DESC
LIMIT 10;
