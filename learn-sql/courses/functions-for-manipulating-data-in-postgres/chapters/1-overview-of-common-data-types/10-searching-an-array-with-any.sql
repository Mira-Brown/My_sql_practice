-- Lesson 10: Searching an ARRAY with ANY
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- ANY searches the entire array regardless of position.
-- Syntax: value = ANY(array_column)
-- Returns TRUE if value matches any element in the array.
--
-- Example — films that have 'Trailers' anywhere in special_features:
SELECT title, special_features
FROM film
WHERE 'Trailers' = ANY(special_features)
LIMIT 5;

-- Exercise: Searching an ARRAY with ANY
-- Objective: Find all films that include 'Behind the Scenes' anywhere
--            in their special_features array.
-- Instructions:
--   1. SELECT title, special_features
--   2. FROM film
--   3. WHERE 'Behind the Scenes' = ANY(special_features)

-- TODO: write your query below
SELECT title, special_features
FROM film
WHERE 'Behind the Scenes' = ANY(special_features);