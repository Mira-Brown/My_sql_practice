-- Exercise: GROUP BY single fields
-- Objective: Use GROUP BY with a single column to produce per-group aggregates.
--
-- Instructions:
--   1. Count the number of films per certification.
--      Select certification and the count aliased as film_count.
--      Order by film_count descending.
--
--   2. Find the average duration of films per language.
--      Select language and the average duration aliased as avg_duration.
--      Round avg_duration to 1 decimal place.
--      Order by avg_duration descending.
--
--   3. Find the total gross per country.
--      Select country and the sum of gross aliased as total_gross.
--      Order by total_gross descending.
--      Limit to 10 results.

-- Query 1
-- TODO: SELECT certification, COUNT(*) AS film_count
--       FROM films GROUP BY certification ORDER BY film_count DESC
SELECT certification, COUNT(*) AS film_count
FROM films
GROUP BY certification
ORDER BY film_count DESC;

-- Query 2
-- TODO: SELECT language, ROUND(AVG(duration), 1) AS avg_duration
--       FROM films GROUP BY language ORDER BY avg_duration DESC
SELECT language, 
ROUND(AVG(duration), 1) AS avg_duration
FROM films
GROUP BY language
ORDER BY avg_duration DESC;

-- Query 3
-- TODO: SELECT country, SUM(gross) AS total_gross
--       FROM films GROUP BY country ORDER BY total_gross DESC LIMIT 10
SELECT country,
SUM(gross) AS total_gross
FROM films
GROUP BY country
ORDER BY total_gross DESC
LIMIT 10;