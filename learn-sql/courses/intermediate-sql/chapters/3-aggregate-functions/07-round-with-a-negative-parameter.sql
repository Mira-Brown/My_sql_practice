-- Exercise: ROUND() with a negative parameter
-- Objective: Use negative decimal_places to round to tens, hundreds, thousands, etc.
--
-- Negative parameters round to the LEFT of the decimal point:
--   ROUND(12345.67, -1)  → 12350    (nearest 10)
--   ROUND(12345.67, -2)  → 12300    (nearest 100)
--   ROUND(12345.67, -3)  → 12000    (nearest 1000)
--   ROUND(12345.67, -4)  → 10000    (nearest 10000)
--
-- Instructions:
--   1. Calculate the average gross from the films table.
--      Round to the nearest thousand (-3). Alias as avg_gross_thousands.
--   2. Calculate the SUM of all budgets from the films table.
--      Round to the nearest million (-6). Alias as total_budget_millions.

-- TODO: Write your queries below

SELECT ROUND(AVG(gross), -3) AS avg_gross_thousands
FROM films;

SELECT ROUND(SUM(budget), -6) AS total_budget_millions
FROM films;
