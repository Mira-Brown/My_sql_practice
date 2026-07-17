-- Lesson 7: Truncate
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- trunc(value, places) truncates toward zero. Negative places truncate to the
-- left of the decimal point — great for making value buckets.
--
-- Example — trunc examples:
SELECT trunc(42.1234, 2)  AS two_places,   -- 42.12
       trunc(12345, -3)   AS to_thousands; -- 12000

-- Exercise: Truncate
-- Objective: Bucket fortune500 employees into groups of 100,000 and count
--            companies per bucket.
-- Instructions:
--   1. trunc(employees, -5) as the bucket.
--   2. count(*) per bucket.
--   3. Order by the bucket.

-- TODO: write your query below
SELECT trunc(employees, -5) AS emp_bucket, count(*) AS n
FROM fortune500
GROUP BY trunc(employees, -5)
ORDER BY emp_bucket;
