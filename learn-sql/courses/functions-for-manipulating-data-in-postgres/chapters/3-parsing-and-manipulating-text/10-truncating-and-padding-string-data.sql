-- Lesson 10: Truncating and padding string data
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Key functions:
--   LPAD(text, length, fill)  → pad on the LEFT  to reach total length
--   RPAD(text, length, fill)  → pad on the RIGHT to reach total length
--   fill defaults to ' ' if omitted; string is truncated if already longer than length

-- Mini-example: zero-padded film IDs and fixed-width title labels
SELECT
    film_id,
    title,
    LPAD(film_id::text, 5, '0')   AS padded_id,
    RPAD(title, 25, '.')          AS fixed_title
FROM film
ORDER BY film_id
LIMIT 10;
