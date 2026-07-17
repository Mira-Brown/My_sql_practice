-- Lesson 8: Generate series
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- generate_series(start, stop, step) produces a row per step — the bin edges of
-- a histogram. Join your data to the series (or compute the bin inline) to get a
-- clean distribution even for empty bins.
--
-- Example — the series of bin lower-edges 0,25,50,75:
SELECT generate_series(0, 75, 25) AS bin;

-- Exercise: Generate series
-- Objective: Build a histogram of question_pct in stackoverflow using 10 bins.
-- Instructions:
--   1. Bucket question_pct into 10-wide bins with trunc.
--   2. Count rows per bin.
--   3. Order by the bin.

-- TODO: write your query below
SELECT trunc(question_pct, -1) AS bin, count(*) AS n
FROM stackoverflow
WHERE question_pct IS NOT NULL
GROUP BY trunc(question_pct, -1)
ORDER BY bin;
