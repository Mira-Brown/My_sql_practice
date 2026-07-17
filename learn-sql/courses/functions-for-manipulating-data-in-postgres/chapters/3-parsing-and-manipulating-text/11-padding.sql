-- Lesson 11: Padding
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Generate a formatted rental rate card
-- Objective: Use LPAD() and RPAD() to produce fixed-width display output.
--
-- Instructions:
--   1. From the film table, select film_id, title, rental_rate, and rating.
--   2. Add a column called film_code:
--      Zero-pad film_id to 4 digits, then append '-' and the first 3 chars of
--      title (uppercased). E.g. film_id=1, title='ACADEMY DINOSAUR' → '0001-ACA'
--      Hint: LPAD(film_id::text, 4, '0') || '-' || LEFT(UPPER(title), 3)
--   3. Add a column called rate_label:
--      Right-pad the rental_rate (cast to text) to 6 characters with spaces,
--      then concatenate 'USD'. E.g. 0.99 → '0.99  USD'
--      Hint: RPAD(rental_rate::text, 6, ' ') || 'USD'
--   4. Add a column called padded_rating:
--      Left-pad rating to 8 characters with '-'. E.g. 'PG' → '------PG'
--   5. Order by film_id.
--   6. Limit to 10 rows.

SELECT
    film_id,
    title,
    rental_rate,
    rating,
    LPAD(film_id::text, 4, '0') || '-' || LEFT(UPPER(title), 3) AS film_code,
    RPAD(rental_rate::text, 6, ' ') || 'USD' AS rate_label,
    LPAD(rating::text, 8, '-') AS padded_rating
FROM film
ORDER BY film_id
LIMIT 10;
