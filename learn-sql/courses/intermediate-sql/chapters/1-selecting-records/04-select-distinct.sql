-- Exercise: SELECT DISTINCT
-- Objective: Use SELECT DISTINCT to return unique values from the films table
--
-- Instructions:
--   1. Select all distinct countries from the films table.
--   2. Select all distinct certifications (e.g. PG-13, R) from the films table.
--   3. Select all distinct languages AND countries together (unique combinations).
--      Note: DISTINCT applies to the combination of all selected columns.

-- TODO: 1. Distinct countries
SELECT DISTINCT country
FROM films;

-- TODO: 2. Distinct certifications
SELECT DISTINCT certification
FROM films;

-- TODO: 3. Distinct language + country combinations
SELECT DISTINCT language,
                country
FROM films;
