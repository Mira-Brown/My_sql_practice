-- Lesson 8: Manipulating the current date and time
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Payments in the last 30 days of data
-- Objective: Use ::date casting and integer subtraction on dates to build
--            a dynamic date filter without hardcoding a literal date.
--
-- Instructions:
--   1. Select payment_id, customer_id, amount, payment_date.
--   2. Cast payment_date to date using ::date — alias as payment_day.
--   3. Filter: payment_date::date > (SELECT MAX(payment_date)::date - 30 FROM payment)
--   4. Order by payment_date DESC.
--   5. LIMIT 10.

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
