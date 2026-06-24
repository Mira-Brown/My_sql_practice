-- Exercise: Debugging Errors
-- Objective: Identify and fix the bug in each broken query
--
-- Instructions:
--   Each query below contains exactly one bug. Fix it.
--
--   1. Retrieve all film titles and release years.
--   2. Count the number of records in the people table.
--   3. Select distinct certifications from the films table.
--   4. Select title and budget from films — budget aliased as cost.

-- TODO: 1. Fix the bug
SELECT title, release_year
FROM films;

-- TODO: 2. Fix the bug
SELECT COUNT(*)
FROM people;

-- TODO: 3. Fix the bug
SELECT DISTINCT(certification)
FROM films;

-- TODO: 4. Fix the bug
SELECT title, budget AS cost
FROM films
WHERE budget IS NOT NULL;
