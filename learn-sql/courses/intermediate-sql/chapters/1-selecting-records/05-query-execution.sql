-- Lesson 5: Query Execution
-- Type: Video (▶)
--
-- Execution order (not the same as written order!):
--   1. FROM       — find the table
--   2. WHERE      — filter rows
--   3. GROUP BY   — group rows
--   4. HAVING     — filter groups
--   5. SELECT     — choose columns / compute expressions
--   6. ORDER BY   — sort results
--   7. LIMIT      — cap the number of rows returned
--
-- Key consequence: you cannot reference a SELECT alias in WHERE,
-- because WHERE runs before SELECT.

-- This query runs fine — FROM first, then SELECT
SELECT title, release_year
FROM films;

-- When we add WHERE later it will run BEFORE SELECT:
-- FROM films → WHERE release_year > 2000 → SELECT title, release_year
