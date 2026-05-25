-- Exercise: Using AND
-- Objective: Filter rows using multiple conditions with AND
--
-- Instructions:
--   1. Select title and release_year for Spanish-language films
--      released after 2000.
--
--   2. Select title, budget, and gross for films where budget > 100000000
--      AND gross > 100000000.
--
--   3. Select title and certification for films rated 'PG' or 'PG-13'
--      that were released between 1990 and 2000 (inclusive).
--      Hint: use AND to combine BETWEEN with the certification filter.
--      For the certification, use: (certification = 'PG' OR certification = 'PG-13')

-- TODO: 1.
SELECT title, release_year, language
FROM films
WHERE language = 'Spanish'
AND release_year > 2000;

-- TODO: 2.
SELECT title, budget, gross
FROM films
WHERE budget > 100000000
AND gross > 100000000;

-- TODO: 3.
SELECT title, certification
FROM films
WHERE (certification = 'PG' OR certification= 'PG-13')
AND release_year BETWEEN  1990 AND  2000;
