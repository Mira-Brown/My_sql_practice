-- Lesson 4: Basic full-text search
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Exercise: Search film descriptions with full-text search
-- Objective: Use to_tsvector() + to_tsquery() + the @@ operator to find films
--            whose description matches a search term.
--
-- Recall: @@ is the match operator between a tsvector and a tsquery.

-- Solution

SELECT
    title,
     description
FROM film
WHERE
    to_tsvector('english',description) @@ to_tsquery('english', 'fateful')
ORDER BY title ASC
;
