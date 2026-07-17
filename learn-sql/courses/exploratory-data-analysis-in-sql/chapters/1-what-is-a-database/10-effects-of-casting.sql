-- Lesson 10: Effects of casting
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Casting converts a value from one type to another with value::type or
-- CAST(value AS type). Casting numeric to integer ROUNDS (not truncates);
-- casting to text lets you use string functions.
--
-- Example — profits cast to integer rounds to the nearest whole number:
SELECT profits, profits::integer AS rounded
FROM fortune500
ORDER BY profits DESC
LIMIT 5;

-- Exercise: Effects of casting
-- Objective: Compare revenues_change (real) as-is vs cast to integer to see how
--            casting changes the value distribution.
-- Instructions:
--   1. Select revenues_change and revenues_change::integer.
--   2. Count how many companies fall into each integer bucket.
--   3. Order by the integer value.

-- TODO: write your query below
SELECT revenues_change::integer AS change_int, count(*) AS n
FROM fortune500
GROUP BY revenues_change::integer
ORDER BY change_int;
