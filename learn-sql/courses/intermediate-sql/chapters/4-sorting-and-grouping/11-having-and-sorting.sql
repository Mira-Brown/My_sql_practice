-- Exercise: HAVING and sorting
-- Objective: Combine GROUP BY, HAVING, and ORDER BY in a single query.
--
-- Instructions:
--   1. Find countries that have produced more than 10 films,
--      showing country and film count aliased as film_count.
--      Order by film_count descending.
--
--   2. Find release years where the average budget exceeds 50 million (50000000),
--      showing release_year and average budget rounded to 0 decimal places,
--      aliased as avg_budget.
--      Only include films released from 1990 onwards.
--      Order by avg_budget descending.

-- Query 1
-- TODO: write your query here
SELECT country, COUNT(*) AS film_count
FROM films
GROUP BY country
HAVING COUNT(*) > 10
ORDER BY film_count DESC;

-- Query 2
-- TODO: write your query here
SELECT release_year, ROUND(AVG(budget), 0) AS avg_budget
FROM films
WHERE release_year >= 1990
GROUP BY release_year
HAVING AVG(budget) > 50000000
ORDER BY avg_budget DESC;
