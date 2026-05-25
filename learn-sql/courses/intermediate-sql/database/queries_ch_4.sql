-- Capstone: Chapter 3 — Aggregate Functions
-- Scenario: You're a film analyst preparing a summary report on the database.
--
-- Q1. How many films have both a budget AND a gross recorded (neither is NULL)?
--     Alias as complete_financials.

SELECT COUNT(*) AS complete_financials
FROM films 
WHERE budget IS NOT NULL AND gross IS NOT NULL;
--
-- Q2. Among films released between 1990 and 2000 (inclusive), what is the:
--     - average budget       → avg_budget      (rounded to 2 decimal places)
--     - average gross        → avg_gross        (rounded to 2 decimal places)
--     - average profit       → avg_profit       (rounded to 2 decimal places)
--     Return all three in a single SELECT.

SELECT ROUND(AVG(budget), 2) AS avg_budget,
       ROUND(AVG(gross), 2) AS avg_gross,
       ROUND(AVG(gross-budget), 2) AS avg_profit
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
--
-- Q3. What is the highest and lowest imdb_score in the reviews table?
--     Alias as max_score and min_score.

SELECT MAX(imdb_score) AS max_score,
       MIN(imdb_score) AS min_score
FROM reviews;
--
-- Q4. What is the average number of Facebook likes for films with an
--     imdb_score of 8.0 or higher?
--     Round to the nearest whole number. Alias as avg_likes_top_films.
--     (both columns are in the reviews table)
SELECT ROUND(AVG(facebook_likes), 0) AS avg_likes_top_films
FROM reviews
WHERE imdb_score >= 8.0;


-- Exercise: Sorting single fields
-- Objective: Use ORDER BY to sort query results by a single column.
--
-- Instructions:
--   1. Select title and duration from films.
--      Sort by duration ascending (shortest first).
--
--   2. Select name from people.
--      Sort alphabetically by name (A to Z).
--
--   3. Select title and gross from films.
--      Sort by gross descending (highest earning first).
--      Limit to 10 results.

-- Query 1
SELECT title, duration
FROM films
ORDER BY duration ASC;

-- Query 2
SELECT name
FROM people
ORDER BY name;

-- Query 3
-- TODO: SELECT title and gross FROM films, ORDER BY gross DESC, LIMIT 10
SELECT title, gross
FROM films
ORDER BY gross DESC 
LIMIT 10;


-- Exercise: Sorting multiple fields
-- Objective: Use ORDER BY with multiple columns to control sort priority.
--
-- Instructions:
--   1. Select title, release_year, and duration from films.
--      Sort by release_year ascending, then by duration descending.
--      (Within each year, longest film first.)
--      Limit to 15 results.
--
--   2. Select title, certification, and gross from films.
--      Sort by certification ascending, then by gross descending.
--      (Within each certification group, highest earner first.)
--      Limit to 20 results.

-- Query 1
-- TODO: SELECT title, release_year, duration FROM films
--       ORDER BY release_year ASC, duration DESC
--       LIMIT 15

SELECT title,
       release_year,
       duration
FROM films
ORDER BY release_year ASC, duration DESC 
LIMIT 15;      


-- Query 2
-- TODO: SELECT title, certification, gross FROM films
--       ORDER BY certification ASC, gross DESC
--       LIMIT 20
SELECT title,
       certification,
       gross
FROM films
ORDER BY certification ASC, gross DESC 
LIMIT 20; 

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

-- Challenge: Which country produced the most films in each decade since 1980?


-- Work out the decade from release_year using (release_year / 10) * 10 — call it decade
-- Count films per decade and country combination, aliased as film_count
-- Only include films from 1980 onwards
-- Order by decade ASC, then film_count DESC
-- Limit to 20 results 

SELECT (release_year / 10) * 10 AS decade,
       country,
       COUNT(*) AS film_count
FROM films
WHERE release_year >= 1980
GROUP BY country, decade
ORDER BY decade ASC, film_count DESC
LIMIT 20;

-- USA dominates every decade by a wide margin, and you can see the industry growing: 
--229 US films in the 80s, 640 in the 90s.

-- "What are the 3 most common film certifications among UK films?"
-- most common	COUNT(*) + ORDER BY ... DESC
-- film certifications	SELECT certification + GROUP BY certification
-- UK films	WHERE country = 'UK'
--3	LIMIT 3

-- Exercise: Filter with HAVING
-- Objective: Use HAVING to filter results after grouping.
--
-- Instructions:
--   1. Find languages where the average film duration exceeds 120 minutes.
--      Select language and AVG(duration) aliased as avg_duration.
--      Order by avg_duration DESC.
--
--   2. Find certifications where the total gross exceeds 1 billion (1000000000).
--      Select certification and SUM(gross) aliased as total_gross.
--      Order by total_gross DESC.

-- Query 1
-- TODO: write your query here
SELECT language, AVG(duration) AS avg_duration
FROM films
GROUP BY language
HAVING AVG(duration) > 120
ORDER BY avg_duration DESC;

-- Query 2
-- TODO: write your query here
SELECT certification, SUM(gross) AS total_gross
FROM films
GROUP BY certification
HAVING SUM(gross) > 1000000000
ORDER BY total_gross DESC;

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

--South Korea's average budget is eye-catching at $1.5 billion — 
--driven by a small number of very high-budget productions.

 -- Capstone: Chapter 4 — Sorting and Grouping
-- Brief: You are a data analyst at a film studio reviewing market trends.
-- Answer each business question below using a single SQL query per section.
--
-- You have access to the films table:
-- films(id, title, release_year, country, duration, language, certification, gross, budget)

-- ─────────────────────────────────────────────
-- Q1. Which 5 certifications generate the highest average gross?
--     Show certification and avg_gross rounded to 0 decimal places.
--     Exclude rows where gross is NULL.
--     Order by avg_gross descending.
-- ─────────────────────────────────────────────
SELECT certification, ROUND(AVG(gross), 0) AS avg_gross
FROM films
WHERE gross IS NOT NULL 
GROUP BY certification
ORDER BY avg_gross DESC 
LIMIT 5;

-- ─────────────────────────────────────────────
-- Q2. How many films were released per decade since 1960?
--     Show decade and film_count.
--     Order by decade ascending.
-- ─────────────────────────────────────────────
SELECT (release_year / 10) * 10 AS decade, COUNT(*) AS film_count
FROM films
WHERE release_year >= 1960
GROUP BY decade
ORDER BY decade ASC;


-- ─────────────────────────────────────────────
-- Q3. Which countries had a total gross above 500 million
--     for films released between 2000 and 2015 inclusive?
--     Show country and total_gross.
--     Order by total_gross descending.
-- ─────────────────────────────────────────────
SELECT country, SUM(gross) AS total_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2015
GROUP BY country
HAVING SUM(gross) > 500000000
ORDER BY total_gross DESC;


-- ─────────────────────────────────────────────
-- Q4. Find the top 3 languages by number of films,
--     but only include languages with more than 20 films
--     and exclude NULL languages.
--     Show language and film_count.
-- ─────────────────────────────────────────────
SELECT language, COUNT(*) film_count
FROM films
WHERE language IS NOT NULL 
GROUP BY language
HAVING COUNT(*) > 20
ORDER BY film_count DESC
LIMIT 3;


	
	
	

