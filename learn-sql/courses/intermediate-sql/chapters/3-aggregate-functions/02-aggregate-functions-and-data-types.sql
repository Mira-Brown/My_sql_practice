-- Exercise: Aggregate functions and data types
-- Objective: Use COUNT, SUM, AVG, MIN, and MAX on appropriate columns.
--
-- Instructions:
--   1. Select the COUNT of all films (use the id column).
--   2. Select the SUM of all film budgets.
--   3. Select the MIN and MAX imdb_score from the reviews table.
--   4. Alias each result clearly (e.g. total_films, total_budget, min_score, max_score).
--
-- Write all four results in a SINGLE SELECT statement.

-- TODO: Write your SELECT statement below

SELECT COUNT(id), SUM(budget) FROM films;
SELECT MIN(imdb_score), MAX(imdb_score) FROM reviews;
