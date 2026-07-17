-- Lesson 9: Extracting and transforming date/time data
-- Type: Video ▶ (50 XP) ✅
-- Engine: PostgreSQL — Sakila DB

-- EXTRACT(field FROM ts)      → numeric component
-- DATE_TRUNC('unit', ts)      → timestamp rounded down to that unit

SELECT
    payment_date,
    EXTRACT(year  FROM payment_date) AS yr,
    EXTRACT(month FROM payment_date) AS mo,
    EXTRACT(dow   FROM payment_date) AS day_of_week,
    DATE_TRUNC('month', payment_date) AS month_bucket,
    DATE_TRUNC('hour',  payment_date) AS hour_bucket
FROM payment
LIMIT 3;
