-- Lesson 2: Count the categories
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- GROUP BY a categorical column + count(*) shows how often each value occurs and
-- surfaces near-duplicates caused by messiness.
--
-- Example — request counts by priority:
SELECT priority, count(*)
FROM evanston311
GROUP BY priority
ORDER BY count DESC;

-- Exercise: Count the categories
-- Objective: Find the 10 most common evanston311 categories.
-- Instructions:
--   1. Group by category.
--   2. count(*) per category.
--   3. Order by count descending, limit 10.

-- TODO: write your query below
SELECT category, count(*) AS n
FROM evanston311
GROUP BY category
ORDER BY n DESC
LIMIT 10;
