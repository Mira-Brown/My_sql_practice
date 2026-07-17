-- Lesson 7: Interval data types
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- INTERVAL represents a duration, not a point in time.
-- Syntax: INTERVAL 'quantity unit'  e.g. INTERVAL '3 days', INTERVAL '1 hour'
-- You can combine units: INTERVAL '1 day 3 hours 30 minutes'
-- Multiply: rental_duration * INTERVAL '1 day'
--
-- Example — add 3 days to a rental date:
SELECT rental_date,
       rental_date + INTERVAL '3 days' AS due_back
FROM rental
LIMIT 5;

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
       '2005-01-01'::date + rental_duration * INTERVAL '1 day'
        AS rental_period_end
FROM film
LIMIT 10;