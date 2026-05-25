-- Lesson 3.1: Summarizing Data (Video)
-- Aggregate functions collapse many rows into one summary value.
--
-- Core functions:
--   COUNT()  -- number of non-NULL values
--   SUM()    -- total
--   AVG()    -- mean
--   MIN()    -- smallest
--   MAX()    -- largest
--
-- Example: how many films are in the database?
SELECT COUNT(id) AS total_films FROM films;

-- Example: what is the average film budget?
SELECT AVG(budget) AS avg_budget FROM films;

-- Example: what are the earliest and latest release years?
SELECT MIN(release_year) AS earliest,
       MAX(release_year) AS latest
FROM films;

-- Run any of these to see aggregate functions in action.
