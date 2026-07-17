-- Lesson 13: Monthly average with missing dates
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- To average a DAILY count over a month correctly, you must divide by ALL days in
-- the month, including zero-request days. Build a daily spine, LEFT JOIN, count
-- per day (0 for gaps), then avg by month.
--
-- Example — average daily requests per month:
SELECT date_trunc('month', days.day) AS month,
       avg(coalesce(daily.n, 0))     AS avg_daily
FROM generate_series(
       (SELECT min(date_created)::date FROM evanston311),
       (SELECT max(date_created)::date FROM evanston311),
       '1 day') AS days(day)
LEFT JOIN (SELECT date_created::date AS day, count(*) AS n
           FROM evanston311 GROUP BY date_created::date) AS daily
       ON days.day = daily.day
GROUP BY date_trunc('month', days.day)
ORDER BY month;

-- Exercise: Monthly average with missing dates
-- Objective: Same as the example, but only for the 'Rodents- Rat Complaint'
--            category (adjust to a category present in your data).
-- Instructions:
--   1. Restrict the daily subquery to one category.
--   2. Keep the full daily spine so empty days count as 0.
--   3. avg per month.

-- TODO: write your query below
SELECT date_trunc('month', days.day) AS month,
       avg(coalesce(daily.n, 0))     AS avg_daily
FROM generate_series(
       (SELECT min(date_created)::date FROM evanston311),
       (SELECT max(date_created)::date FROM evanston311),
       '1 day') AS days(day)
LEFT JOIN (SELECT date_created::date AS day, count(*) AS n
           FROM evanston311
           WHERE category ILIKE '%rodent%'
           GROUP BY date_created::date) AS daily
       ON days.day = daily.day
GROUP BY date_trunc('month', days.day)
ORDER BY month;
