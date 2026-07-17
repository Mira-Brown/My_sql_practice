-- Lesson 4: Calculating the expected return date
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Flag late returns per customer
-- Objective: Combine INTERVAL arithmetic with a CASE expression to identify
--            rentals returned after the expected due date.
--
-- Join path:
--   rental -> inventory -> film   (inventory_id, then film_id)
--   rental -> customer            (customer_id)
--
-- Instructions:
--   1. Select r.rental_id, c.first_name, c.last_name, f.title, r.rental_date.
--   2. Compute expected_return: rental_date + f.rental_duration * INTERVAL '1 day'
--   3. Compute actual_return:   r.return_date
--   4. Compute is_late: CASE WHEN return_date > expected_return THEN 'Late' ELSE 'On time' END
--      Note: you can reference the alias expected_return inside CASE — think about
--            whether PostgreSQL allows alias reuse in SELECT (hint: it doesn't —
--            repeat the expression or use a subquery/CTE).
--   5. LIMIT 10.

SELECT
    r.rental_id,
    c.first_name,
    c.last_name,
    f.title,
    r.rental_date,
    rental_date + f.rental_duration * INTERVAL '1 day' AS expected_return,
    r.return_date AS actual_return,
CASE WHEN r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day'
     THEN 'Late' ELSE 'On time' END AS is_late
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS F ON i.film_id = f.film_id
JOIN customer AS c ON r.customer_id = c.customer_id
LIMIT 10;