-- Exercise: Formatting
-- Objective: Write clean, well-formatted SQL from scratch
--
-- Instructions:
--   Write each query from scratch using correct formatting.
--   Each query must: use UPPERCASE keywords, lowercase identifiers,
--   one clause per line, named columns, and a semicolon.
--
--   1. Select title, release_year, and certification from films.
--      Alias certification as cert.
--
--   2. Select the number of films (alias as film_count)
--      and the number of distinct countries (alias as country_count)
--      from films — both in a single query.
--
--   3. Select title and duration from films.
--      Alias duration as length_mins.

-- TODO: 1.
SELECT title,
       release_year,
       certification AS cert
FROM films;       

-- TODO: 2.
SELECT COUNT(title) AS film_count,
       COUNT(DISTINCT country) AS country_count
FROM films;       

-- TODO: 3.
SELECT title,
       duration AS length_mins
FROM films;  

SELECT COUNT(title) AS film_count,
       COUNT(language) AS films_with_language,
       COUNT(DISTINCT certification) AS cert_count
FROM films;
