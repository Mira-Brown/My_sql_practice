-- Lesson 5: Completion time by category
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Aggregate an interval with avg() per group to compare responsiveness.
--
-- Example — average completion time by priority:
SELECT priority, avg(date_completed - date_created) AS avg_time
FROM evanston311
WHERE date_completed IS NOT NULL
GROUP BY priority
ORDER BY avg_time;

-- Exercise: Completion time by category
-- Objective: Find the 5 categories with the LONGEST average completion time.
-- Instructions:
--   1. Group completed requests by category.
--   2. avg(date_completed - date_created) as avg_time.
--   3. Order by avg_time descending, limit 5.

-- TODO: write your query below
SELECT category, avg(date_completed - date_created) AS avg_time
FROM evanston311
WHERE date_completed IS NOT NULL
GROUP BY category
ORDER BY avg_time DESC
LIMIT 5;
