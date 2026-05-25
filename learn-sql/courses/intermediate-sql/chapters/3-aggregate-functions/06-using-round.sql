-- Exercise: Using ROUND()
-- Objective: Use ROUND() to control decimal places in aggregate results.
--
-- ROUND() syntax: ROUND(value, decimal_places)
-- e.g. ROUND(4.567, 2) → 4.57
--      ROUND(4.567, 1) → 4.6
--      ROUND(4.567, 0) → 5.0
--
-- Instructions:
--   1. Calculate the average imdb_score from the reviews table.
--      Round to 2 decimal places. Alias as avg_score.
--   2. Calculate the average budget from the films table.
--      Round to the nearest whole number (0 decimal places). Alias as avg_budget.

-- TODO: Write your queries below

SELECT ROUND(AVG(imdb_score), 2) AS avg_score
FROM reviews;

SELECT ROUND(AVG(budget), 0) AS avg_budget
FROM films;
