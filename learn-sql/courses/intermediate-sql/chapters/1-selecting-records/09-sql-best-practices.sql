-- Exercise: SQL Best Practices
-- Objective: Rewrite poorly styled queries using correct SQL conventions
--
-- Instructions:
--   The queries below all produce correct results but are poorly written.
--   Rewrite each one using proper SQL style:
--     - UPPERCASE keywords
--     - lowercase identifiers
--     - one clause per line
--     - named columns instead of SELECT *
--     - semicolon at the end
--
--   1. select * from people
--
--   2. SELECT title, BUDGET, GROSS
--      from Films
--
--   3. select distinct LANGUAGE from films

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
