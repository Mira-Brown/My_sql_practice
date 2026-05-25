-- Exercise: Aliasing with functions
-- Objective: Combine aggregate functions, arithmetic, and aliases in one query.
--
-- Instructions:
--   1. Calculate the average budget and average gross for all films.
--      Round both to 2 decimal places.
--      Alias as avg_budget and avg_gross.
--
--   2. Calculate the average profit (gross - budget) for films released
--      in or after 1990. Round to 2 decimal places.
--      Alias as avg_profit.
--
-- Write each as its own SELECT statement.

-- TODO: Write your queries below

SELECT ROUND(AVG(budget), 2) AS avg_budget,
       ROUND(AVG(gross), 2) AS avg_gross
FROM films;

SELECT ROUND(AVG(gross-budget), 2) AS avg_profit
FROM films
WHERE release_year > 1990;