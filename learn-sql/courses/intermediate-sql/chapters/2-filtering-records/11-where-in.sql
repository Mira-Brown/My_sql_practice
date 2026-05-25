-- Exercise: WHERE IN
-- Objective: Use IN and NOT IN to filter against a list of values
--
-- Instructions:
--   1. Select title and language for films in English, Spanish, or French.
--      Use IN.
--
--   2. Select title and certification for films that are NOT rated
--      'R', 'NC-17', or 'X'. Use NOT IN.
--
--   3. Select title and country for films from Germany, France, or Japan
--      released after 1990. Combine IN with AND.
--
--   4. Count how many films are from the following countries:
--      'USA', 'UK', 'Australia', 'Canada'.
--      Alias the result as english_speaking_films.

-- TODO: 1.
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

-- TODO: 2.
SELECT title, certification
FROM films
WHERE certification NOT IN ('R', 'NC-17', 'X');

-- TODO: 3.
SELECT title, country
FROM films
WHERE country IN ('Germany', 'France', 'Japan')
AND release_year > 1990;

-- TODO: 4.
SELECT COUNT(*) AS english_speaking_films
FROM films    
WHERE country IN  ('USA', 'UK', 'Australia', 'Canada');


