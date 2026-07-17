-- Lesson 4: Cases and spaces
-- Type: Exercise </> (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Normalize case and strip surrounding spaces so equivalent values group as one.
--
-- Example — distinct source values, normalized:
SELECT DISTINCT lower(trim(source)) AS source
FROM evanston311
ORDER BY source;

-- Exercise: Cases and spaces
-- Objective: Count requests per category after normalizing case and trimming
--            spaces, so messy duplicates merge.
-- Instructions:
--   1. Apply lower() and trim() to category.
--   2. Group by the normalized value.
--   3. Order by count descending, limit 10.

-- TODO: write your query below
SELECT lower(trim(category)) AS category, count(*) AS n
FROM evanston311
GROUP BY lower(trim(category))
ORDER BY n DESC
LIMIT 10;
