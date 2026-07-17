-- Lesson 4: Replacing string data
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (table set: film, actor, rental, payment, customer, …). Built via ../../database/setup.sh
--
-- Instructor fills brief / runnable example / TODO starter here during the lesson.
-- (No solution committed to chapters/.)

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    REPLACE(email, 'sakilacustomer.org', 'email.com') AS clean_email,
    REPLACE(
        email,
        SUBSTRING(email FROM 1 FOR POSITION('@' IN email) - 1),
        '***'
    ) AS masked_email
FROM customer
LIMIT 10;