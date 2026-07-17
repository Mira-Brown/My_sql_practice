-- Lesson 11: Summarize the distribution of numeric values
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Grouping by a value and counting reveals its distribution. Casting a
-- continuous column to integer (or truncating it) buckets nearby values
-- together so the shape becomes visible.
--
-- Example — distribution of unanswered_pct (rounded to 1 decimal) in stackoverflow:
SELECT round(unanswered_pct::numeric, 1) AS pct, count(*)
FROM stackoverflow
WHERE unanswered_pct IS NOT NULL
GROUP BY round(unanswered_pct::numeric, 1)
ORDER BY pct;

-- Exercise: Summarize the distribution of numeric values
-- Objective: Show the distribution of profits_change bucketed to whole percents.
-- Instructions:
--   1. Cast profits_change to integer as a bucket.
--   2. Count companies per bucket.
--   3. Order by the bucket value.

-- TODO: write your query below
SELECT profits_change::integer AS change, count(*) AS n
FROM fortune500
WHERE profits_change IS NOT NULL
GROUP BY profits_change::integer
ORDER BY change;
