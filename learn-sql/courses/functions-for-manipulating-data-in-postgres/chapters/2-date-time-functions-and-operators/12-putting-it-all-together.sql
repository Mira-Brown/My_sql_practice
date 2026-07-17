-- Lesson 12: Putting it all together
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Monthly rental summary — avg duration and avg days overdue
-- Objective: Combine DATE_TRUNC, EXTRACT(epoch), INTERVAL arithmetic,
--            ROUND, and aggregate FILTER in one query.
--
-- Join path: rental -> inventory -> film
--
-- Instructions:
--   1. DATE_TRUNC('month', r.rental_date) AS rental_month
--   2. COUNT(*) AS total_rentals
--   3. ROUND(AVG(EXTRACT(epoch FROM (r.return_date - r.rental_date)) / 86400)::numeric, 1)
--        AS avg_days_rented
--   4. ROUND(AVG(EXTRACT(epoch FROM (r.return_date - (r.rental_date + f.rental_duration * INTERVAL '1 day')))
--        / 86400)::numeric FILTER (WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day'), 1)
--        AS avg_days_overdue
--   5. WHERE r.return_date IS NOT NULL
--   6. GROUP BY rental_month ORDER BY rental_month

SELECT
    DATE_TRUNC('month', r.rental_date) AS rental_month,
    COUNT(*) AS total_rentals,
    ROUND(AVG(EXTRACT(epoch FROM (r.return_date - r.rental_date)) /
     86400)::numeric, 1) AS avg_days_rented,
    ROUND(
    (AVG(EXTRACT(epoch FROM (r.return_date - (r.rental_date + f.rental_duration * INTERVAL '1 day'))) / 86400)
     FILTER (WHERE r.return_date > r.rental_date + f.rental_duration * INTERVAL '1 day')
    )::numeric, 1) AS avg_days_overdue
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS F ON i.film_id = f.film_id
WHERE r.return_date IS NOT NULL
GROUP BY rental_month 
ORDER BY rental_month;
