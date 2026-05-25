-- Exercise: Practice with COUNT()
-- Objective: Use COUNT() to explore what data is available in the films table
--
-- Instructions:
--   1. Count the total number of records in the films table.
--   2. Count the number of films that have a recorded budget (budget is not NULL).
--   3. Count the number of films that have a recorded gross (gross is not NULL).
--   4. Count the number of distinct languages in the films table.
--      Hint: COUNT(DISTINCT column) counts unique non-NULL values.

-- TODO: 1. Total records in films
SELECT COUNT(*)
FROM films;

-- TODO: 2. Films with a budget recorded
SELECT COUNT(budget)
FROM films;

-- TODO: 3. Films with a gross recorded
SELECT COUNT(gross)
FROM films;

-- TODO: 4. Number of distinct languages
SELECT COUNT(DISTINCT language)
FROM films;
