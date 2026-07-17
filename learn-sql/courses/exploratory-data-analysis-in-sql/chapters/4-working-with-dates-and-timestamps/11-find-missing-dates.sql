-- Lesson 11: Find missing dates
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- To find dates with NO requests, generate the full range of days and keep those
-- absent from the data (anti-join / NOT IN).
--
-- Example — days in the data's range that had zero requests:
SELECT day
FROM generate_series(
       (SELECT min(date_created)::date FROM evanston311),
       (SELECT max(date_created)::date FROM evanston311),
       '1 day') AS day
WHERE day NOT IN (SELECT DISTINCT date_created::date FROM evanston311);

-- Exercise: Find missing dates
-- Objective: List the calendar days within the data range that recorded no
--            completed requests.
-- Instructions:
--   1. generate_series over min..max date_created (as date), step 1 day.
--   2. Keep days NOT IN the set of distinct date_completed::date.

-- TODO: write your query below
SELECT day
FROM generate_series(
       (SELECT min(date_created)::date FROM evanston311),
       (SELECT max(date_created)::date FROM evanston311),
       '1 day') AS day
WHERE day NOT IN (
    SELECT DISTINCT date_completed::date
    FROM evanston311
    WHERE date_completed IS NOT NULL
)
ORDER BY day;
