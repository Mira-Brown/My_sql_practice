-- Lesson 2: Division
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Integer / integer = integer (the remainder is DISCARDED). To get a fractional
-- result, cast one operand to numeric first.
--
-- Example — integer vs numeric division:
SELECT 7 / 2            AS int_div,      -- 3
       7::numeric / 2   AS numeric_div;  -- 3.5

-- Exercise: Division
-- Objective: Compute average profit-per-employee, being careful about integer
--            division.
-- Instructions:
--   1. Divide profits by employees.
--   2. Cast so the result keeps its decimal part.
--   3. Return the value for the 5 companies with the most employees.

-- TODO: write your query below
SELECT title,
       profits::numeric / employees AS profit_per_employee
FROM fortune500
ORDER BY employees DESC
LIMIT 5;
