-- Lesson 8: Variation by day of week
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- date_part('dow', ts) returns 0=Sunday..6=Saturday. to_char(ts, 'Day') gives the
-- name (space-padded — trim it).
--
-- Example — requests by weekday name:
SELECT to_char(date_created, 'Day') AS weekday, count(*)
FROM evanston311
GROUP BY weekday, date_part('dow', date_created)
ORDER BY date_part('dow', date_created);

-- Exercise: Variation by day of week
-- Objective: Count requests for each day of the week, ordered Sun..Sat.
-- Instructions:
--   1. Group by date_part('dow', date_created) and its trimmed name.
--   2. count(*) per day.
--   3. Order by the dow number.

-- TODO: write your query below
SELECT trim(to_char(date_created, 'Day'))  AS weekday,
       count(*)                            AS n
FROM evanston311
GROUP BY trim(to_char(date_created, 'Day')), date_part('dow', date_created)
ORDER BY date_part('dow', date_created);
