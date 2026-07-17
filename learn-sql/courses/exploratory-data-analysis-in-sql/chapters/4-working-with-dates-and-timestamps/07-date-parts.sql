-- Lesson 7: Date parts
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- EXTRACT(field FROM ts) / date_part('field', ts) returns a numeric component.
--
-- Example — requests per month number:
SELECT EXTRACT(month FROM date_created) AS month, count(*)
FROM evanston311
GROUP BY month
ORDER BY month;

-- Exercise: Date parts
-- Objective: Count requests by year and month to see the monthly trend.
-- Instructions:
--   1. EXTRACT year and month from date_created.
--   2. Count per (year, month).
--   3. Order by year, month.

-- TODO: write your query below
SELECT EXTRACT(year  FROM date_created) AS year,
       EXTRACT(month FROM date_created) AS month,
       count(*) AS n
FROM evanston311
GROUP BY year, month
ORDER BY year, month;
