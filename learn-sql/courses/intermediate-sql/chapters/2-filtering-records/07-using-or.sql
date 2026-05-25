-- Exercise: Using OR
-- Objective: Filter rows where at least one condition is true
--
-- Instructions:
--   1. Select title and language for films in French OR German.
--
--   2. Select title and certification for films rated 'G', 'PG', or 'PG-13'.
--      (chain two OR conditions)
--
--   3. Select title, country, and release_year for films from India OR Japan
--      released after 2000.
--      Use parentheses to group the OR correctly with AND.

-- TODO: 1.
SELECT title, language
FROM films
WHERE (language = 'French' OR language= 'German');

-- TODO: 2.
SELECT title, certification
FROM films
WHERE (certification = 'G' OR certification ='PG' OR certification = 'PG-13');

-- TODO: 3.
SELECT title, country, release_year
FROM films
WHERE (country = 'India' OR country = 'Japan')
AND release_year > 2000;
