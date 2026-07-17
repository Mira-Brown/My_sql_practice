-- Lesson 11: Measuring similarity between two strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- similarity(text, text) from pg_trgm returns a score between 0.0 and 1.0.
-- It works by breaking each string into overlapping 3-character chunks (trigrams)
-- and measuring how many they share. 1.0 = identical, 0.0 = no trigrams in common.
--
-- Exercise: Find film titles similar to 'DRAGON'
-- Objective: Use similarity() to score each film title against the word 'DRAGON',
--            filter to meaningful matches, and rank by closeness.
--
-- Solution
SELECT
    title,
    similarity(title, 'DRAGON') AS sim
FROM film
WHERE
    similarity(title, 'DRAGON') > 0.3
ORDER BY sim DESC
;
