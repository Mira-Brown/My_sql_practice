-- Lesson 7: Truncating strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Create short previews of film descriptions
-- Objective: Use LEFT() and SUBSTRING() to truncate long text to a fixed width.
--
-- Instructions:
--   1. From the film table, select title and description.
--   2. Add a column called short_desc using LEFT() that returns only
--      the first 50 characters of description.
--   3. Add a column called preview using SUBSTRING() that returns
--      characters 1 through 50 of description — same result, different syntax.
--   4. Add a column called title_code using LEFT() that returns
--      the first 3 characters of title (useful as a short code).
--   5. Order by title.
--   6. Limit to 10 rows.

SELECT
    title,
    description,
    LEFT(description, 50) AS short_desc,
    SUBSTRING(description FROM 1 FOR 50) AS preview,
    LEFT(title, 3) AS title_code
FROM film
ORDER BY title
LIMIT 10;
