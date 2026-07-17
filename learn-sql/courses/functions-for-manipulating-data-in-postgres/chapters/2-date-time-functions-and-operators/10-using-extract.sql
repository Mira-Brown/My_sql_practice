-- Lesson 10: Using EXTRACT
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Revenue by quarter and year
-- Objective: Use EXTRACT to pull year and quarter from payment_date,
--            then aggregate to see which periods had the most activity.
--
-- Instructions:
--   1. Select EXTRACT(year FROM payment_date) AS year.
--   2. Select EXTRACT(quarter FROM payment_date) AS quarter.
--   3. COUNT(*) AS total_payments.
--   4. SUM(amount) AS total_revenue.
--   5. GROUP BY year, quarter.
--   6. ORDER BY year, quarter.

SELECT
    EXTRACT(year FROM payment_date) AS year,
    EXTRACT(quarter FROM payment_date) AS quarter,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY year, quarter
ORDER BY year, quarter
