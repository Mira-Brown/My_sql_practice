-- Exercise: Using BETWEEN
-- Objective: Filter rows using range conditions with BETWEEN
--
-- Remember: BETWEEN is inclusive on both ends.
--
-- Instructions:
--   1. Select title and release_year for films released between 1980 and 1990.
--
--   2. Select title and duration for films with a duration between 90 and 120 minutes.
--      Alias duration as length_mins.
--
--   3. Select title and budget for films with budget between 10000000 and 50000000,
--      from the USA only.
--      Combine BETWEEN with AND for the country filter.
--
--   4. Select title and release_year for films NOT released between 2000 and 2010.
--      Hint: NOT BETWEEN x AND y

-- TODO: 1.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1980 and 1990;


-- TODO: 2.
SELECT title,
       duration AS length_mins
FROM films
WHERE duration BETWEEN 90 AND 120;

-- TODO: 3.
SELECT title,
       budget,
       country
FROM films
WHERE (country = 'USA' AND budget BETWEEN 10000000 AND 50000000);

-- TODO: 4.
SELECT title, release_year
FROM films
WHERE release_year NOT BETWEEN 2000 AND 2010;


SELECT title, 
       release_year, 
       gross, 
       country
FROM films       
WHERE (country='USA' OR country= 'UK')
  AND release_year 
  BETWEEN 1990 AND 2000
  AND gross > 50000000;       