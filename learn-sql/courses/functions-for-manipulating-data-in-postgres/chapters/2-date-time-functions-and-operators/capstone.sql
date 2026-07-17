-- ============================================================
-- CAPSTONE — Chapter 2: Working with DATE/TIME Functions and Operators
-- ============================================================
-- Engine: PostgreSQL — Sakila DVD-rental database.
--
-- Scenario: The store manager wants a customer reliability report.
-- For each customer, show:
--   - How many rentals they made in total
--   - Their first rental date and most recent rental date
--   - How many days between their first and most recent rental (their "tenure")
--   - How many rentals were returned late
--   - Their late return rate as a percentage (rounded to 1 decimal)
--   - Whether they are a "Reliable" customer (late rate < 30%) or "At Risk" (30%+)
--
-- Requirements:
--   1. customer_id, first_name, last_name (from customer)
--   2. COUNT(*) AS total_rentals
--   3. MIN(r.rental_date)::date AS first_rental
--   4. MAX(r.rental_date)::date AS last_rental
--   5. MAX(r.rental_date)::date - MIN(r.rental_date)::date AS tenure_days
--   6. COUNT(*) FILTER (WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day')
--        AS late_returns
--   7. ROUND(
--        (COUNT(*) FILTER (WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day')
--         * 100.0 / COUNT(*))::numeric, 1)
--        AS late_pct
--   8. CASE WHEN late_pct < 30 ... — note: alias reuse won't work, repeat the expression
--        THEN 'Reliable' ELSE 'At Risk' END AS reliability
--
-- Join path: customer -> rental -> inventory -> film
--   (rental.customer_id, rental.inventory_id, inventory.film_id)
-- Filter: only rentals where return_date IS NOT NULL
-- GROUP BY customer_id, first_name, last_name
-- ORDER BY late_pct DESC
-- LIMIT 20

-- Write your query below:
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(*) AS total_rentals,
    MIN(r.rental_date)::date AS first_rental,
    MAX(r.rental_date)::date AS last_rental,
    MAX(r.rental_date)::date - MIN(r.rental_date)::date AS tenure_days,
    COUNT(*) FILTER (
        WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day'
    ) AS late_returns,
    ROUND(
        (COUNT(*) FILTER (
            WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day'
        ) * 100.0 / COUNT(*))::numeric, 1
    ) AS late_pct,
    CASE
        WHEN ROUND(
            (COUNT(*) FILTER (
                WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day'
            ) * 100.0 / COUNT(*))::numeric, 1
        ) < 30 THEN 'Reliable'
        ELSE 'At Risk'
    END AS reliability
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.return_date IS NOT NULL
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY late_pct DESC
LIMIT 20;