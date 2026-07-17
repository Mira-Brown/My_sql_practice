-- Lesson 4: Summarize numeric columns
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Combine several summary functions in one SELECT to profile a column's spread.
--
-- Example — profile the profits column:
SELECT min(profits), avg(profits), max(profits), stddev(profits)
FROM fortune500;

-- Exercise: Summarize numeric columns
-- Objective: Profile employees for companies in the 'Retailing' sector.
-- Instructions:
--   1. Filter to sector = 'Retailing'.
--   2. Return min, avg, max, and stddev of employees.

-- TODO: write your query below
SELECT min(employees)    AS min_emp,
       avg(employees)    AS avg_emp,
       max(employees)    AS max_emp,
       stddev(employees) AS sd_emp
FROM fortune500
WHERE sector = 'Retailing';
