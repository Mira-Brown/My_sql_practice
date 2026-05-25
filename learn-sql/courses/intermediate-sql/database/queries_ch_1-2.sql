SELECT title,
       release_year,
	   country
FROM films;

SELECT *
FROM films

-- total number of films
SELECT COUNT(*)
FROM films;

-- films where language is recorded (not NULL)
SELECT COUNT(language)
FROM films;

-- compare both in one query
SELECT COUNT(*) AS total_films,
       COUNT(language) AS films_with_language
FROM films;	

-- Total records in films
SELECT *
FROM films;

-- TODO: 2. Films with a budget recorded
SELECT COUNT(budget)
FROM films;

-- TODO: 3. Films with a gross recorded
SELECT COUNT(budget)
FROM films;

-- TODO: 4. Number of distinct languages
SELECT COUNT(DISTINCT language)
FROM films;

-- TODO: 1. Distinct countries
SELECT DISTINCT country
FROM films;

-- TODO: 2. Distinct certifications
SELECT DISTINCT certification
FROM films;

-- TODO: 3. Distinct language + country combinations
SELECT DISTINCT language,
                country
FROM films;

-- TODO: 1. title + gross aliased as earnings, sorted by earnings
SELECT title,
       gross AS earnings
FROM films
ORDER BY earnings;       

-- TODO: 2. title + language for French-language films only
SELECT title,
       language
FROM films
WHERE language = 'French'

-- TODO: 3. Fixed version of the broken query
SELECT title, 
       release_year AS yr
FROM films
WHERE release_year >= 2010;

-- TODO: 1. Fix the bug
SELECT title, release_year
FROM films;

-- TODO: 2. Fix the bug
SELECT COUNT(*)
FROM people;

-- TODO: 3. Fix the bug
SELECT DISTINCT(certification)
FROM films;

-- TODO: 4. Fix the bug
SELECT title, budget AS cost
FROM films
WHERE budget IS NOT NULL;

SELECT title,
       release_year,
       country
FROM films
WHERE country = 'USA';

-- TODO: 1. Rewrite using best practices (select name and birthdate from people)
SELECT name,
       birthdate
FROM people;

-- TODO: 2. Rewrite using best practices
SELECT title, 
       budget, 
       gross
FROM films;

-- TODO: 3. Rewrite using best practices
SELECT DISTINCT language
FROM films;

-- TODO: 1.Select title, release_year, and certification from films.
--      Alias certification as cert.
SELECT title,
       release_year,
       certification AS cert
FROM films;       

-- TODO: 2.Select the number of films (alias as film_count)
--      and the number of distinct countries (alias as country_count)
--      from films — both in a single query.
--
SELECT COUNT(title) AS film_count,
       COUNT(DISTINCT country) AS country_count
FROM films;       

-- TODO: 3.Select title and duration from films.
--      Alias duration as length_mins.
SELECT title,
       duration AS length_mins
FROM films;  

--In a single well-formatted query, find:
-- The total number of films (film_count)
-- The number of films with a known language (films_with_language)
-- The number of distinct certifications (cert_count)

SELECT COUNT(title) AS film_count,
       COUNT(language) AS films_with_language,
       COUNT(DISTINCT certification) AS cert_count
FROM films;

--   1. How many films are in the database?
--      (alias: total_films)

SELECT COUNT(title) AS total_films
FROM films;

--   2. How many unique release years does the dataset span?
--      (alias: years_covered)

SELECT COUNT(DISTINCT release_year) AS years_covered
FROM films;

--   3. How many films have a recorded gross AND a recorded budget?
--      Hint: you'll need two COUNT(column) calls in one query.
--      (aliases: films_with_gross, films_with_budget)

SELECT COUNT(gross) AS films_with_gross,
       COUNT(budget) AS films_with_budget
FROM films;	 

 --   4. How many distinct countries and distinct languages are represented?
--      Both in a single query.
--      (aliases: country_count, language_count)

SELECT  COUNT(DISTINCT country ) AS country_count,
        COUNT(DISTINCT language) AS language_count
FROM films;

--   5. Pull a sample of 5 films showing: title, release_year, country,
--      and language. This will be used as a preview in the report.
--      Hint: use LIMIT to cap results at 5.
SELECT title,
       release_year,
       country,
       language
FROM films
LIMIT 5;       

-- Films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000;

-- Films with a budget of exactly 100 million
SELECT title, budget
FROM films
WHERE budget = 100000000;

-- Films shorter than 90 minutes
SELECT title, duration
FROM films
WHERE duration < 90;

-- Number filter
SELECT title, release_year
FROM films
WHERE release_year = 2000;

-- Text filter — note single quotes
SELECT title, country
FROM films
WHERE country = 'USA';

--   1. Select title and release_year for films released before 1990.
SELECT title,
       release_year
FROM films
WHERE release_year< 1990; 

--   2. Select title and duration for films longer than 180 minutes.
--      Alias duration as length_mins.
SELECT title,
       duration AS length_mins
FROM films
WHERE duration > 180; 

--   3. Select title and budget for films where budget is not equal to 0.
--      Use the <> operator.
SELECT title,
       budget
FROM films
WHERE budget <> 0; 

--   4. Select title and gross for films where gross is greater than
--      or equal to 200000000 (200 million).
SELECT title, gross
FROM films
WHERE gross >= 200000000;

--   1. Select title and language for films where language is 'Spanish'.
SELECT title,
       language
FROM films
WHERE language = 'Spanish';

--   2. Select title and certification for films that are NOT rated 'R'.
--      Use the <> operator.
SELECT title , certification
FROM films
WHERE certification <> 'R';

--   3. Select name and birthdate from people where name is 'Kanye West'.
SELECT name, birthdate
FROM people
WHERE name = 'Kanye West';

--   4. Select title, country, and language for films
--      where country is 'Japan'.
SELECT title,
       country,
       language
FROM films
WHERE country = 'Japan';

-- AND: US films after 2000
SELECT title, release_year, country
FROM films
WHERE release_year > 2000
  AND country = 'USA';


-- OR: films from USA or UK
SELECT title, country
FROM films
WHERE country = 'USA'
   OR country = 'UK';	
	
		
-- BETWEEN: films from the 1990s (inclusive)
SELECT title,
       release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;	

-- Mixed AND + OR with parentheses
SELECT title,
       release_year,
	   country
FROM films
WHERE (country = 'USA' OR country = 'UK')
  AND release_year > 2000;   

-- TODO: 1.
SELECT title,
       release_year,
	   language
FROM films
WHERE language = 'Spanish'
  AND release_year > 2000;

-- TODO: 2.
SELECT title,
       budget, 
	   gross
FROM films
WHERE budget > 100000000
  AND gross > 100000000;

-- TODO: 3.
SELECT title, 
       certification
FROM films
WHERE (certification = 'PG' 
   OR certification= 'PG-13')
AND release_year 
   BETWEEN  1990 AND  2000;


-- TODO: 1. Select title and language for films in French OR German.
SELECT title, language
FROM films
WHERE (language = 'French' 
   OR language= 'German');   
   

-- TODO: 2. Select title and certification for films rated 'G', 'PG', or 'PG-13'.
--      (chain two OR conditions)
SELECT title, certification
FROM films
WHERE (certification = 'G' 
   OR certification ='PG' 
   OR certification = 'PG-13');

-- TODO:3. Select title, country, and release_year for films from India OR Japan
--      released after 2000.
--      Use parentheses to group the OR correctly with AND.
SELECT title, country, release_year
FROM films
WHERE (country = 'India' 
   OR country = 'Japan')
AND release_year > 2000;


--   1. Select title and release_year for films released between 1980 and 1990.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1980 and 1990;

--   2. Select title and duration for films with a duration between 90 and 120 minutes.
--      Alias duration as length_mins.
SELECT title,
       duration AS length_mins
FROM films
WHERE duration BETWEEN 90 AND 120;

--   3. Select title and budget for films with budget between 10000000 and 50000000,
--      from the USA only.
--      Combine BETWEEN with AND for the country filter.
SELECT title,
       budget,
       country
FROM films
WHERE (country = 'USA' AND budget BETWEEN 10000000 AND 50000000);

--   4. Select title and release_year for films NOT released between 2000 and 2010.
--      Hint: NOT BETWEEN x AND y
SELECT title, release_year
FROM films
WHERE release_year NOT BETWEEN 2000 AND 2010;

--Find all films that are either:
-- From the USA, released between 1990 and 2000, with a gross over 50 million, OR
-- From the UK, released between 1990 and 2000, with a gross over 50 million

SELECT title, 
       release_year, 
       gross, 
       country
FROM films       
WHERE (country='USA' OR country= 'UK')
  AND release_year 
  BETWEEN 1990 AND 2000
  AND gross > 50000000;    

-- Titles starting with 'The'
SELECT title
FROM films
WHERE title LIKE 'The%';  

-- Titles containing 'love' anywhere
SELECT title
FROM films
WHERE title LIKE '%love%';

SELECT title
FROM films
WHERE title LIKE 'love%';

-- Titles that do NOT start with 'The'
SELECT title
FROM films
WHERE title NOT LIKE 'The%';

--   1. Select title for films whose title starts with 'War'.
SELECT title 
FROM films
WHERE title like 'War%';

--   2. Select name from people whose name ends with 'son'
--      (e.g. Harrison, Anderson).
SELECT name
FROM people
WHERE name LIKE '%son';

--   3. Select title for films whose title contains 'man' anywhere.
--      Then write a second query: the same but using NOT LIKE
--      to find films whose title does NOT contain 'man'.
SELECT title 
FROM films
WHERE title LIKE '%man%'

--   4. Select title for films whose title starts with any character
--      followed by exactly 'he ' (three characters: h, e, space).
--      Hint: use _ for the first character, then 'he '.
SELECT title 
FROM films
WHERE title LIKE '_he%';

--   1. Select title and language for films in English, Spanish, or French.
--      Use IN.
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

--   2. Select title and certification for films that are NOT rated
--      'R', 'NC-17', or 'X'. Use NOT IN.
SELECT title, certification
FROM films
WHERE certification NOT IN ('R', 'NC-17', 'X');

--   3. Select title and country for films from Germany, France, or Japan
--      released after 1990. Combine IN with AND.
SELECT title, country
FROM films
WHERE country IN ('Germany', 'France', 'Japan')
AND release_year > 1990;

--   4. Count how many films are from the following countries:
--      'USA', 'UK', 'Australia', 'Canada'.
--      Alias the result as english_speaking_films.
SELECT COUNT(*) AS english_speaking_films
FROM films    
WHERE country IN  ('USA', 'UK', 'Australia', 'Canada');

--   1. Select title, release_year, and gross for English-language films
--      released between 2000 and 2010 with gross over 100 million.
SELECT title,
       release 

-- TODO: 1. Select title, release_year, and gross for English-language films
--      released between 2000 and 2010 with gross over 100 million.
SELECT title, 
       release_year, 
       gross
FROM films
WHERE language = 'English' 
AND release_year BETWEEN 2000 AND 2010
AND gross >  100000000    

-- TODO: 2. Select title and certification for films certified 'G' or 'PG'
--      whose title starts with 'The'.
SELECT title,
    certification
FROM films
WHERE certification IN ('G', 'PG') AND title like 'The%';   

-- TODO: 3. Count the number of films from the USA released in the 1980s
--      (1980–1989 inclusive) that have a budget recorded.
--      Alias as usa_80s_with_budget.
SELECT COUNT(*) AS usa_80s_with_budget
FROM films
WHERE country = 'USA' 
AND release_year BETWEEN 1980 AND 1989
AND budget is NOT NULL;

-- TODO:4. Select title and country for films NOT from the USA or UK,
--      whose title contains 'night', released after 1990.
SELECT title,
       country,
       release_year
FROM films 
WHERE title LIKE '%night%' 
AND country NOT IN ('UK', 'USA') 
AND release_year  > 1990 ;

-- Films with no language recorded
SELECT title, language
FROM films
WHERE language IS NULL;


-- Films with a gross recorded
SELECT title, gross
FROM films
WHERE gross IS NOT NULL;

-- People with no recorded birthdate
SELECT name, birthdate
FROM people
WHERE birthdate IS NULL;

-- How many films are missing a language?
SELECT COUNT(*) - COUNT(language) AS missing_language
FROM films;

-- How many people have no recorded birthdate?
SELECT COUNT(*) - COUNT(birthdate) AS missing_birthdate
FROM people;


SELECT *
FROM films;

--   1. Select title and language for films where language is missing (NULL).
SELECT title, language
FROM films
WHERE language IS NULL;

--   2. Select title and gross for films where gross IS NOT NULL,
--      released after 2010.
SELECT title, gross
FROM films
WHERE gross IS NOT  NULL AND release_year > 2010

--   3. Count how many people have no recorded deathdate.
--      Alias as still_alive_or_unknown.
SELECT COUNT(*) AS  still_alive_or_unknown
FROM people
WHERE deathdate IS NULL;

--   4. Select title for films where BOTH budget AND gross are NULL
--      (completely missing financial data).
SELECT title, budget, gross
FROM films
WHERE budget IS NULL AND gross IS NULL;



  