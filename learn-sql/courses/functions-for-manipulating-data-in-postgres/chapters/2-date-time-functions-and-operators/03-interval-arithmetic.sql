-- Lesson 3: INTERVAL arithmetic
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: When was each DVD due back?
-- Objective: Multiply an integer column by INTERVAL '1 day' to build a dynamic
--            due date, and subtract timestamps to get actual rental duration.
--
-- Join path: rental -> inventory -> film
--   rental.inventory_id = inventory.inventory_id
--   inventory.film_id   = film.film_id
--
-- Instructions:
--   1. Select r.rental_id, f.title, r.rental_date.
--   2. Compute due_date: rental_date + f.rental_duration * INTERVAL '1 day'
--   3. Compute days_rented: return_date - rental_date
--   4. LIMIT 10.

SELECT
    r.rental_id,
    f.title,
    r.rental_date,
    rental_date + f.rental_duration * INTERVAL '1 day' AS due_date,
    return_date - rental_date AS days_rented
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS F ON i.film_id   = f.film_id
LIMIT 10;
