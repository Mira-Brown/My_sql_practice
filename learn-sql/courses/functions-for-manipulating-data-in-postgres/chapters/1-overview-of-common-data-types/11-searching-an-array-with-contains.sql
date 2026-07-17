-- Lesson 11: Searching an ARRAY with @>
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- @> is the "contains" operator: left array must contain ALL elements
-- of the right array.
-- Syntax: array_column @> ARRAY['value']::text[]
--
-- Difference from ANY:
--   ANY  → checks if ONE value exists in the array
--   @>   → checks if the array contains ALL values in a given list
--          (useful for filtering on multiple features at once)

-- Exercise: Searching an ARRAY with @>
-- Objective: Find all films whose special_features contains
--            'Behind the Scenes' using @> instead of ANY.
-- Instructions:
--   1. SELECT title, special_features
--   2. FROM film
--   3. WHERE special_features @> ARRAY['Behind the Scenes']::text[]

-- TODO: write your query below
SELECT title, special_features
FROM film
WHERE special_features @> ARRAY['Behind the Scenes']::text[];
