-- Lesson 12: Custom aggregation periods
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- To bin into custom periods (e.g. months) with no gaps: build a series of period
-- starts, then LEFT JOIN the data matched by date_trunc.
--
-- Example — monthly counts with every month present:
SELECT months.month, count(e.id) AS requests
FROM (SELECT generate_series(date_trunc('month', (SELECT min(date_created) FROM evanston311)),
                             date_trunc('month', (SELECT max(date_created) FROM evanston311)),
                             '1 month') AS month) AS months
LEFT JOIN evanston311 AS e
       ON date_trunc('month', e.date_created) = months.month
GROUP BY months.month
ORDER BY months.month;

-- Exercise: Custom aggregation periods
-- Objective: Count requests per month, showing zero for any month with none.
-- Instructions:
--   1. Build a generate_series of month starts across the data range.
--   2. LEFT JOIN evanston311 on date_trunc('month', date_created).
--   3. count(id) per month (counts NULL as 0), ordered by month.

-- TODO: write your query below
SELECT months.month, count(e.id) AS requests
FROM (SELECT generate_series(date_trunc('month', (SELECT min(date_created) FROM evanston311)),
                             date_trunc('month', (SELECT max(date_created) FROM evanston311)),
                             '1 month') AS month) AS months
LEFT JOIN evanston311 AS e
       ON date_trunc('month', e.date_created) = months.month
GROUP BY months.month
ORDER BY months.month;
