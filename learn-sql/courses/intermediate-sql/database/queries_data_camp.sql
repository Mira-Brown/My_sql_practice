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
	
	
-- Practice with aggregate functions
-- Calculate the sum duration of all films
SELECT COUNT(*), SUM(duration) AS total_duration
FROM films;

-- Calculate the average duration of all films
SELECT COUNT(*) AVG(duration) AS average_duration
FROM films;

-- Find the latest release_year
SELECT MAX(release_year) as latest_year
FROM films

-- Find the duration of the shortest film
SELECT MIN(duration) AS shortest_film
FROM films;

-- Calculate the sum of gross from the year 2000 or later
SELECT COUNT(*), SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;

-- Calculate the average gross of films that start with A
SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%'

-- Calculate the lowest gross film in 1994
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

--ROUNDING 
-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes), 1) AS avg_facebook_likes
FROM reviews;

--ROUND() with a negative parameter
-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget), -3) AS avg_budget_thousands
FROM films;

--ARITHEMIC FUNC
-- Calculate the title and duration_hours from films
SELECT title, (duration / 60.0) AS duration_hours
FROM films;

--Calculate the percentage of people who are no longer alive and alias the result as percentage_dead
SELECT COUNT(deathrate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Find the number of decades in the films table
SELECT decade / 10.0 AS number_of_decades
FROM films;

--Find how many decades (period of ten years) the films table covers by using MIN() 
--and MAX(); alias as number_of_decades
-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Round duration_hours to two decimal places
SELECT title, ROUND(duration / 60.0, 2) AS duration_hours
FROM films;

--Sorting single fields
-- Select name from people and sort alphabetically
SELECT name
FROM people
ORDER BY name ASC;

-- Select the title and duration from longest to shortest film
SELECT title, duration 
FROM films
ORDER BY duration DESC;

-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;

-- Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title
FROM films
ORDER BY certification ASC, release_year DESC;

--Select the release_year and count of films released in each year aliased as film_count
-- Find the release_year and film_count of each year
SELECT release_year, COUNT(*) AS film_count
FROM films
GROUP BY release_year;

-- Find the release_year and average duration of films for each year
SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year;

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country;


--SORTING AND FILTERING USING HAVING
-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10

-- Select the country and average_budget from films
SELECT country, ROUND(AVG(budget),2) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING ROUND(AVG(budget),2) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;

--All together now
-- Select the release_year for films released after 1990 grouped by year
SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- Modify the query to include the average budget aliased as avg_budget and 
--average gross aliased as avg_gross for the results we have so far.
-- Modify the query to also list the average budget and average gross and avg_budget greater thn 60 milllion
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
ORDER BY avg_gross DESC
LIMIT 1;


