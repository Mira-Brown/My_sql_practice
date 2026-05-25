-- Exercise: LIKE and NOT LIKE
-- Objective: Use pattern matching to filter text columns
--
-- Instructions:
--   1. Select title for films whose title starts with 'War'.
--
--   2. Select name from people whose name ends with 'son'
--      (e.g. Harrison, Anderson).
--
--   3. Select title for films whose title contains 'man' anywhere.
--      Then write a second query: the same but using NOT LIKE
--      to find films whose title does NOT contain 'man'.
--
--   4. Select title for films whose title starts with any character
--      followed by exactly 'he ' (three characters: h, e, space).
--      Hint: use _ for the first character, then 'he '.

-- TODO: 1.
SELECT title 
FROM films
WHERE title like 'War%';

-- TODO: 2.
SELECT name
FROM people
WHERE name LIKE '%son';

-- TODO: 3a. Contains 'man'
SELECT title 
FROM films
WHERE title LIKE '%man%'

-- TODO: 3b. Does NOT contain 'man'
SELECT title 
FROM films
WHERE title NOT LIKE '%man%'

-- TODO: 4.
SELECT title 
FROM films
WHERE title LIKE '_he %';
