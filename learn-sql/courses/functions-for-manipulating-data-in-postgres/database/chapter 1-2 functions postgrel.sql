SELECT film_id,
       title,
       release_year,        -- type: year (user-defined domain)
       rental_duration,     -- type: smallint
       rental_rate,         -- type: numeric(4,2)
       last_update,         -- type: timestamp
       special_features     -- type: text[] (ARRAY)
FROM film
LIMIT 5;

SELECT title,           -- VARCHAR(255)
       description,     -- TEXT
       rating           -- VARCHAR(6)
FROM film
LIMIT 3;

-- Exercise: Getting information about your database
-- Objective: Use information_schema.columns to inspect the film table
-- Instructions:
--   1. SELECT column_name and data_type
--   2. FROM information_schema.columns
--   3. WHERE table_name is 'film'
--   4. ORDER BY ordinal_position  (keeps columns in their original table order)
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film'
ORDER BY ordinal_position;

-- Exercise: Determining data types
-- Objective: Find all columns in the `rental` table that store date or
--            time information.
-- Instructions:
--   1. SELECT column_name and data_type
--   2. FROM information_schema.columns
--   3. WHERE table_name = 'rental'
--   4. AND data_type contains 'date' OR 'time'
--      (hint: LIKE '%date%' and LIKE '%time%' — mind the AND/OR precedence)
--   5. ORDER BY ordinal_position

-- TODO: write your query below
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'rental'
AND (data_type LIKE '%date%' OR 
data_type LIKE '%time%')
ORDER BY ordinal_position;

-- Exercise: Interval data types
-- Objective: For each film, calculate the rental period end date by adding
--            rental_duration (an integer, number of days) to a fixed start
--            date of '2005-01-01'.
-- Instructions:
--   1. SELECT title, rental_duration
--   2. Add rental_duration to the date '2005-01-01'::date using INTERVAL
--      Hint: rental_duration * INTERVAL '1 day'
--   3. Alias the calculated column as rental_period_end
--   4. FROM film
--   5. LIMIT 10

-- TODO: write your query below
SELECT title, 
       rental_duration,
       '2005-01-01'::date 
	   + rental_duration * INTERVAL '1 day'
        AS rental_period_end
FROM film
LIMIT 10;

-- Exercise: Searching an ARRAY with ANY
-- Objective: Find all films that include 'Behind the Scenes' anywhere
--            in their special_features array.
-- Instructions:
--   1. SELECT title, special_features
--   2. FROM film
--   3. WHERE 'Behind the Scenes' = ANY(special_features)

-- TODO: write your query below
SELECT title, special_features
FROM film
WHERE 'Behind the Scenes' = ANY(special_features);

-- CAPSTONE 
-- Engine: PostgreSQL — Sakila DVD-rental database.
--
-- Scenario: The Sakila store manager wants a report of "premium films" —
-- films that:
--   1. Are rated 'PG' or 'PG-13'  (rating column, VARCHAR)
--   2. Include 'Behind the Scenes' in their special_features (@> or ANY)
--   3. Have a rental_duration of 5 days or more

-- Write your query below:
SELECT title,
       rating,
       rental_duration,
       '2005-06-01'::date + rental_duration * INTERVAL '1 day' AS rental_period_end,
       special_features 
       FROM film
WHERE rating IN ('PG', 'PG-13')
AND rental_duration >=5
AND 'Behind the Scenes' = ANY(special_features)
ORDER BY rental_duration DESC, title ASC;      

__ Chapter 2
SELECT
    rental_id,
    rental_date,
    return_date,
    return_date - rental_date  AS rental_duration,
    rental_date + INTERVAL '3 days' AS projected_return
FROM rental
LIMIT 10;

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

SELECT
    payment_id,
    customer_id,
    amount,
    payment_date,
    payment_date::date AS payment_day
FROM payment
WHERE payment_date::date > (SELECT MAX(payment_date)::date - 30 FROM payment)
ORDER BY payment_date DESC
LIMIT 10;

SELECT
    EXTRACT(year FROM payment_date) AS year,
    EXTRACT(quarter FROM payment_date) AS quarter,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY year, quarter
ORDER BY year, quarter

SELECT
    DATE_TRUNC('day', payment_date) AS payment_day,
    COUNT(*) AS num_payments,
    SUM(amount) AS daily_revenue
FROM payment
GROUP BY payment_day
ORDER BY payment_day;

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

SELECT
    email,
    CHAR_LENGTH(email)                                   AS email_len,
    POSITION('@' IN email)                               AS at_pos,
    LEFT(email, POSITION('@' IN email) - 1)              AS local_part,
    SUBSTRING(email FROM POSITION('@' IN email) + 1)     AS domain
FROM customer
LIMIT 5;
