-- Lesson 2: A review of the LIKE operator
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Exercise: Find films using LIKE pattern matching
-- Objective: Practice LIKE / NOT LIKE / wildcards before we replace them with full-text search

--
-- Hint: LIKE is case-sensitive in PostgreSQL — all titles in the sakila DB are uppercase.
-- Wildcards: % matches any sequence of characters, _ matches exactly one character.

-- Solution

SELECT
     title,
     description
FROM film
WHERE
   title LIKE 'ELF%'
    AND title NOT LIKE '%MURDER%'
ORDER BY title ASC;

