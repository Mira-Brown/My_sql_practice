-- Lesson 1: Filtering Numbers
-- Type: Video (▶)
--
-- WHERE filters rows before SELECT runs.
-- Comparison operators: =  <>  <  >  <=  >=

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
