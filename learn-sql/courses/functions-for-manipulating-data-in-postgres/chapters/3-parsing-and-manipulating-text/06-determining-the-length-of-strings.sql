-- Lesson 6: Determining the length of strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Analyse film title and description lengths
-- Objective: Use CHAR_LENGTH() to measure string data and filter on it.
--
-- Instructions:
--   1. From the film table, select title and description.
--   2. Add a column called title_length — the number of characters in title.
--   3. Add a column called description_length — the number of characters in description.
--   4. Filter to only films where the title is longer than 12 characters.
--   5. Order results by title_length DESC.
--   6. Limit to 10 rows.

SELECT
    title,
    description,
    LENGTH(title) AS title_length,
    LENGTH(description) AS description_length
FROM film
WHERE LENGTH(title) > 12
ORDER BY title_length DESC
LIMIT 10;
