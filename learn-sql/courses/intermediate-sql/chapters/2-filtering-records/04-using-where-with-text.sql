-- Exercise: Using WHERE with Text
-- Objective: Filter films using text comparisons
--
-- Instructions:
--   1. Select title and language for films where language is 'Spanish'.
--
--   2. Select title and certification for films that are NOT rated 'R'.
--      Use the <> operator.
--
--   3. Select name and birthdate from people where name is 'Kanye West'.
--
--   4. Select title, country, and language for films
--      where country is 'Japan'.

-- TODO: 1.
SELECT title,
       language
FROM films
WHERE language = 'Spanish';       


-- TODO: 2.
SELECT title , certification
FROM films
WHERE certification <> 'R';

-- TODO: 3.
SELECT name, birthdate
FROM people
WHERE name = 'Kanye West';

-- TODO: 4.
SELECT title,
       country,
       language
FROM films
WHERE country = 'Japan';       


