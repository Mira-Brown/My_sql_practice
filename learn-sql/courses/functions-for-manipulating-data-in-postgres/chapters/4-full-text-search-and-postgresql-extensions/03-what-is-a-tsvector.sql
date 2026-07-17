-- Lesson 3: What is a tsvector?
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Exercise: Inspect tsvector output on the film table
-- Objective: Use to_tsvector() to convert text columns into their tsvector
--            representation and observe how words are stemmed and stop words removed.
--
-- Notice in the output: words are lowercased, stemmed (e.g. 'feminist' stays,
-- 'battling' → 'battl'), and common stop words like 'a', 'the', 'and' are removed.
-- Each word is followed by its position(s) in the original text.

-- Solution

SELECT
    title,
     description,
    to_tsvector('english', description) AS description_vector
FROM film
WHERE rating = 'PG'
LIMIT 10;