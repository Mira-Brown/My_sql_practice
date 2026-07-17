-- Lesson 16: Rats!
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- A mini-investigation combining text search + date aggregation: track rodent
-- ("rat") complaints over time.
--
-- Example — monthly count of rat-related requests:
SELECT date_trunc('month', date_created) AS month, count(*)
FROM evanston311
WHERE category ILIKE '%rodent%' OR description ILIKE '%rat%'
GROUP BY month
ORDER BY month;

-- Exercise: Rats!
-- Objective: For rat-related requests, report the average completion time and the
--            total count per month.
-- Instructions:
--   1. Filter to category ILIKE '%rodent%' OR description ILIKE '%rat%'.
--   2. Group by month via date_trunc.
--   3. Return month, count(*), avg(date_completed - date_created).

-- TODO: write your query below
SELECT date_trunc('month', date_created)          AS month,
       count(*)                                   AS rat_requests,
       avg(date_completed - date_created)         AS avg_completion
FROM evanston311
WHERE category ILIKE '%rodent%' OR description ILIKE '%rat%'
GROUP BY date_trunc('month', date_created)
ORDER BY month;
