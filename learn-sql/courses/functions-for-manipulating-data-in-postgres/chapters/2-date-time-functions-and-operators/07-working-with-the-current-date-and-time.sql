-- Lesson 7: Working with the current date and time
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Find DVDs that were never returned
-- Objective: Use NOW() to compute how long a rental has been outstanding,
--            and filter on NULL return_date to find missing DVDs.
--
-- Instructions:
--   1. Select r.rental_id, c.first_name, c.last_name, r.rental_date.
--   2. Compute days_since_rental: NOW() - r.rental_date
--   3. Filter to rentals where return_date IS NULL.
--   4. Join rental to customer on customer_id.
--   5. LIMIT 10.

SELECT
    r.rental_id,
    c.first_name,
    c.last_name,
    r.rental_date,
    NOW() - r.rental_date AS days_since_rental
FROM rental AS r
JOIN customer AS c ON r.customer_id = c.customer_id
WHERE return_date IS NULL
LIMIT 10;
