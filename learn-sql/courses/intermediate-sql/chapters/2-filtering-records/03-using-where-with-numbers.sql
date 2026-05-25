-- Exercise: Using WHERE with Numbers
-- Objective: Filter films using numeric comparisons
--
-- Instructions:
--   1. Select title and release_year for films released before 1990.
--
--   2. Select title and duration for films longer than 180 minutes.
--      Alias duration as length_mins.
--
--   3. Select title and budget for films where budget is not equal to 0.
--      Use the <> operator.
--
--   4. Select title and gross for films where gross is greater than
--      or equal to 200000000 (200 million).

-- TODO: 1.
SELECT title,
       release_year
FROM films
WHERE release_year< 1990;       

-- TODO: 2.
SELECT title,
       duration AS length_mins
FROM films
WHERE duration > 180;      

-- TODO: 3.
SELECT title,
       budget
FROM films
WHERE budget <> 0;       


-- TODO: 4.
SELECT title, gross
FROM films
WHERE gross >= 200000000;
