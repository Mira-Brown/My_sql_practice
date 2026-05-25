-- Select all details for German-language films released after 2000 
-- but before 2010 using only WHERE and AND.
SELECT *
FROM films
WHERE release_year > 2000
    AND release_year < 2010
    AND language = 'German';

-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year 
FROM films
WHERE release_year  = 1990 OR release_year = 1999

-- Add a filter to see only English or Spanish-language films
	AND (language = 'English' OR language = 'Spanish');
	-- Filter films with more than $2,000,000 gross
	AND gross > 2000000
	
-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year

-- LIKE and NOT LIKE
-- Select the names that start with B
SELECT *
FROM people
WHERE names LIKE 'B%'


SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%'

SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%'

--WHERE IN
-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
    AND duration > 120;

-- Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
AND language IN ('English', 'Italian', 'Greek');	


--Combining filtering and selecting
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');
	

-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;

-- Count the number of films we have language data for
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;
	
	




FROM films
WHERE release_year BETWEEN 1990 AND 2000
-- Narrow down your query to films with budgets > $100 million
	AND budget > 100000000	
	-- Amend the query to include Spanish or French-language films
	AND (language = 'Spanish' OR language = 'French')