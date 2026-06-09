-- Exercise: UNION vs. UNION ALL
-- Objective: Stack two economy snapshots and understand how UNION differs from UNION ALL.
--
-- The database has two tables:
--   economies2015  — columns: code, year, income_group, gross_savings
--   economies2019  — columns: code, year, income_group, gross_savings
--
-- Instructions:
--   1. Write a query using UNION ALL to return all rows from economies2015
--      followed by all rows from economies2019.
--      Select: code, year, income_group
--   2. Below it, write the same query using UNION instead of UNION ALL.
--   3. Note the difference in row counts in the results.

-- TODO: Part 1 — UNION ALL (keeps duplicates)
SELECT code, year, income_group
FROM economies2015
UNION ALL
SELECT code, year, income_group
FROM economies2019;

-- TODO: Part 2 — UNION (removes duplicates)
SELECT code, year, income_group
FROM economies2015
UNION
SELECT code, year, income_group
FROM economies2019;