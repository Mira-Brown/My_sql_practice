-- Lesson 6: Exploring distributions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- To see a numeric column's distribution, bucket continuous values into ranges,
-- then count rows per bucket. Two common bucketing tools:
--   * trunc(value, places) — chop toward zero to a number of decimal places;
--       negative places round to tens/hundreds (trunc(12345, -3) = 12000)
--   * generate_series(start, stop, step) — build the bucket boundaries
--
-- Example — companies bucketed by revenues to the nearest 100,000:
SELECT trunc(revenues, -5) AS rev_bucket, count(*)
FROM fortune500
GROUP BY rev_bucket
ORDER BY rev_bucket;
