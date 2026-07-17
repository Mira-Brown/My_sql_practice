-- Lesson 2: Adding and subtracting date and time values
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DB
--
-- Exercise: Rental duration and a projected return
-- Objective: Practice timestamp subtraction and date addition
--            against the rental table.
--
-- The rental table has:
--   rental_id   smallint
--   rental_date timestamp
--   return_date timestamp
--
-- Instructions:
--   1. Select rental_id, rental_date, and return_date.
--   2. Subtract rental_date FROM return_date to get the actual duration;
--      alias it as rental_duration.
--   3. Add 3 days (integer 3) to rental_date to get a projected_return date;
--      alias it as projected_return.
--   4. Limit to 10 rows.

SELECT
    rental_id,
    rental_date,
    return_date,
    return_date - rental_date  AS rental_duration,
    rental_date + INTERVAL '3 days' AS projected_return
FROM rental
LIMIT 10;
