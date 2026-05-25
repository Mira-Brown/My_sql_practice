-- Exercise: GROUP BY multiple fields
-- Objective: Group by more than one column to get finer-grained aggregates.
--
-- Instructions:
--   1. Count films per country and certification combination.
--      Select country, certification, and the count aliased as film_count.
--      Order by country ASC, then film_count DESC.
--      Limit to 15 results.
--
--   2. Find the average budget per release_year and language combination.
--      Select release_year, language, and avg_budget (rounded to 0 decimal places).
--      Exclude rows where language is NULL.
--      Order by release_year DESC, avg_budget DESC.
--      Limit to 15 results.

-- Query 1
SELECT country, certification, COUNT(*) AS film_count
FROM films
GROUP BY country, certification
ORDER BY country ASC, film_count DESC
LIMIT 15;

-- Query 2
-- TODO: write your query here
SELECT release_year, language, ROUND(AVG(budget),0) AS avg_budget
FROM films
WHERE language IS NOT NULL
GROUP BY release_year, language
ORDER BY release_year DESC, avg_budget DESC
LIMIT 15;

SELECT (release_year / 10) * 10 AS decade,
       country,
       COUNT(*) AS film_count
FROM films
WHERE release_year >= 1980
GROUP BY country, decade
ORDER BY decade ASC, film_count DESC
LIMIT 20;
