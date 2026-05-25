-- Exercise: All together now
-- Objective: Write a query using WHERE, GROUP BY, HAVING, ORDER BY, and LIMIT together.
--
-- Instructions:
--   Find the top 5 countries by average film budget, but only consider:
--     - Films released from 2000 onwards
--     - Countries with more than 5 films in the dataset
--   Show country and average budget rounded to 0 decimal places, aliased as avg_budget.
--   Order by avg_budget descending.
--   Limit to 5 results.

-- TODO: write your query here
SELECT country, ROUND(AVG(budget), 0) AS avg_budget
FROM films
WHERE release_year >= 2000
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY avg_budget DESC
LIMIT 5;