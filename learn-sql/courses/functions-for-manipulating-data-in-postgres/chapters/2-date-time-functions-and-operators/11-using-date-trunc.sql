-- Lesson 11: Using DATE_TRUNC
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Daily revenue report
-- Objective: Use DATE_TRUNC to bucket payments by day and aggregate revenue.
--
-- Instructions:
--   1. DATE_TRUNC('day', payment_date) AS payment_day.
--   2. COUNT(*) AS num_payments.
--   3. SUM(amount) AS daily_revenue.
--   4. GROUP BY payment_day.
--   5. ORDER BY payment_day.

SELECT
    DATE_TRUNC('day', payment_date) AS payment_day,
    COUNT(*) AS num_payments,
    SUM(amount) AS daily_revenue
FROM payment
GROUP BY payment_day
ORDER BY payment_day;
