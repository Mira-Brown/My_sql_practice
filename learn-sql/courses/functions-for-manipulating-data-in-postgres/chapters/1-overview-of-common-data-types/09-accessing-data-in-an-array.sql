-- Lesson 9: Accessing data in an ARRAY
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- Access array elements with [index] — PostgreSQL arrays are 1-indexed.
-- special_features[1] → first feature, special_features[2] → second feature
--
-- Example — show first and second special features for each film:
SELECT title,
       special_features[1] AS first_feature,
       special_features[2] AS second_feature
FROM film
LIMIT 5;

-- Exercise: Accessing data in an ARRAY
-- Objective: Select the title, the first element of special_features
--            aliased as first_feature, and filter to only films where
--            the first feature is 'Deleted Scenes'.
-- Instructions:
--   1. SELECT title, special_features[1] AS first_feature
--   2. FROM film
--   3. WHERE special_features[1] = 'Deleted Scenes'

-- TODO: write your query below
SELECT title,
       special_features[1] AS first_feature
FROM film
WHERE special_features[1] = 'Deleted Scenes';
       