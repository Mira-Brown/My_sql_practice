-- ============================================================
-- CAPSTONE — Chapter 1: Overview of Common Data Types
-- ============================================================
-- Engine: PostgreSQL — Sakila DVD-rental database.
--
-- Scenario: The Sakila store manager wants a report of "premium films" —
-- films that:
--   1. Are rated 'PG' or 'PG-13'  (rating column, VARCHAR)
--   2. Include 'Behind the Scenes' in their special_features (@> or ANY)
--   3. Have a rental_duration of 5 days or more
--
-- For each qualifying film, show:
--   - title
--   - rating
--   - rental_duration
--   - special_features
--   - rental_period_end: what date a rental would be due back
--     if rented on '2005-06-01' (use INTERVAL arithmetic)
--
-- Order by rental_duration DESC, then title ASC.
--
-- Hints:
--   - Use IN ('PG', 'PG-13') for the rating filter
--   - special_features @> ARRAY['Behind the Scenes']::text[]
--   - rental_duration >= 5
--   - '2005-06-01'::date + rental_duration * INTERVAL '1 day'
-- ============================================================

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