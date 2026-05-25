-- Exercise: Combining Filtering and Selecting
-- Objective: Apply WHERE, AND, OR, IN, BETWEEN, and LIKE together
--
-- Instructions:
--   1. Select title, release_year, and gross for English-language films
--      released between 2000 and 2010 with gross over 100 million.
--
--   2. Select title and certification for films certified 'G' or 'PG'
--      whose title starts with 'The'.
--
--   3. Count the number of films from the USA released in the 1980s
--      (1980–1989 inclusive) that have a budget recorded.
--      Alias as usa_80s_with_budget.
--
--   4. Select title and country for films NOT from the USA or UK,
--      whose title contains 'night', released after 1990.

-- TODO: 1.
SELECT title, 
       release_year, 
       gross
FROM films
WHERE language = 'English' 
AND release_year BETWEEN 2000 AND 2010
AND gross >  100000000    

-- TODO: 2.
SELECT title,
    certification
FROM films
WHERE certification IN ('G', 'PG') AND title like 'The%';   

-- TODO: 3.
SELECT COUNT(*) AS usa_80s_with_budget
FROM films
WHERE country = 'USA' 
AND release_year BETWEEN 1980 AND 1989
AND budget is NOT NULL;

-- TODO: 4.
SELECT title,
       country,
       release_year
FROM films 
WHERE title LIKE '%night%' 
AND country NOT IN ('UK', 'USA') 
AND release_year  > 1990 ;