-- Chapter 2 Capstone: Film Market Analysis
--
-- Brief:
--   The analytics team is preparing a report on film market trends.
--   Answer each question below with a well-formatted SQL query.
--   All queries must follow best practices: UPPERCASE keywords,
--   lowercase identifiers, named aliases, semicolons.
--
-- Questions:
--
--   1. The team wants to focus on commercially successful films.
--      Find all films with a gross over 200 million released after 2000.
--      Return title, release_year, and gross.
--
--   2. A regional report needs films from France, Germany, or Italy
--      released between 1980 and 2000.
--      Return title, country, and release_year.
--
--   3. How many films in the database have BOTH a budget AND gross recorded?
--      Alias as fully_tracked_films.
--
--   4. The compliance team needs films rated 'R' or 'NC-17'
--      that are NOT in English.
--      Return title, certification, and language.
--
--   5. Find all films whose title starts with 'Black' or ends with 'Story'.
--      Return title and release_year.
--      Hint: use OR with two LIKE conditions.
--
--   6. Data quality check: how many films are missing a country value?
--      Alias as missing_country.

-- Q1. 
SELECT title,
       gross,
       release_year
FROM films
WHERE release_year > 2000 
AND gross > 200000000;

-- Q2.
SELECT title,
       country, 
       release_year
FROM films
WHERE country IN ('France', 'Germany', 'Italy')
AND release_year BETWEEN 1980 AND 2000;

-- Q3.
SELECT COUNT(*) AS fully_tracked_films
FROM films
WHERE budget IS NOT NULL AND gross IS NOT NULL;

-- Q4.
SELECT title, 
       certification,
       language
FROM films
WHERE certification IN('R', 'NC-17')
AND language <> 'English'

-- Q5.
SELECT title, release_year
FROM films
WHERE title LIKE 'Black%' OR  title LIKE '%Story';

-- Q6.
SELECT COUNT(*) AS missing_country
FROM films
WHERE country IS NULL;

