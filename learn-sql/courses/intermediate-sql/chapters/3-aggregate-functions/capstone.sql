-- Capstone: Chapter 3 — Aggregate Functions
-- Scenario: You're a film analyst preparing a summary report on the database.
-- Use what you've learned to answer each question below.
--
-- Q1. How many films have both a budget AND a gross recorded (neither is NULL)?
--     Alias as complete_financials.
--
-- Q2. Among films released between 1990 and 2000 (inclusive), what is the:
--     - average budget       → avg_budget      (rounded to 2 decimal places)
--     - average gross        → avg_gross        (rounded to 2 decimal places)
--     - average profit       → avg_profit       (rounded to 2 decimal places)
--     Return all three in a single SELECT.
--
-- Q3. What is the highest and lowest imdb_score in the reviews table?
--     Alias as max_score and min_score.
--
-- Q4. What is the average number of Facebook likes for films with an
--     imdb_score of 8.0 or higher?
--     Round to the nearest whole number. Alias as avg_likes_top_films.
--     (both columns are in the reviews table)

-- TODO: Write your queries below


SELECT COUNT(*) AS complete_financials
FROM films 
WHERE budget IS NOT NULL AND gross IS NOT NULL;

SELECT ROUND(AVG(budget), 2) AS avg_budget,
       ROUND(AVG(gross), 2) AS avg_gross,
       ROUND(AVG(gross-budget), 2) AS avg_profit
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

SELECT MAX(imdb_score) AS max_score,
       MIN(imdb_score) AS min_score
FROM reviews;

SELECT ROUND(AVG(facebook_likes), 0) AS avg_likes_top_films
FROM reviews
WHERE imdb_score >= 8.0;

