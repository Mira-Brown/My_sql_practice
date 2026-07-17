-- Lesson 13: Putting it all together
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Build a film catalog report
-- Objective: Combine CONCAT/||, UPPER/LOWER/INITCAP, REPLACE, CHAR_LENGTH,
--            SUBSTRING, LEFT/RIGHT, LPAD, RPAD, and TRIM in one query.
--
-- Instructions:
--   1. From the film table, select film_id, title, description, rental_rate, rating.
--   2. Add catalog_code:
--      LPAD(film_id::text, 4, '0') || '-' || LEFT(UPPER(title), 4)
--      E.g. film_id=3 → '0003-ADAP'
--   3. Add display_title:
--      INITCAP(title)
--   4. Add short_desc:
--      First 50 chars of TRIM(description), with '...' appended
--      Hint: LEFT(TRIM(description), 50) || '...'
--   5. Add title_len:
--      CHAR_LENGTH(title)
--   6. Add rate_display:
--      RPAD('$' || rental_rate::text, 8, ' ') — e.g. '$0.99   '
--   7. Add clean_rating:
--      REPLACE(rating::text, '-', '/') — turns 'NC-17' into 'NC/17', 'PG-13' into 'PG/13'
--   8. Filter: only films where CHAR_LENGTH(title) BETWEEN 8 AND 15.
--   9. Order by catalog_code.
--  10. Limit to 15 rows.

SELECT
    film_id,
    title,
    description,
    rental_rate,
    rating,
    -- catalog_code
    LPAD(film_id::text, 4, '0') || '-' || LEFT(UPPER(title), 4) AS catalog_code,
    -- display_title
    INITCAP(title) AS display_title,
    -- short_desc
    LEFT(TRIM(description), 50) || '...' AS short_desc,
    -- title_len
    CHAR_LENGTH(title) AS title_len,
    -- rate_display
    RPAD('$' || rental_rate::text, 8, ' ') AS rate_display,
    -- clean_rating
    REPLACE(rating::text, '-', '/') AS clean_rating
FROM film
WHERE CHAR_LENGTH(title) BETWEEN 8 AND 15
ORDER BY catalog_code
LIMIT 15;
