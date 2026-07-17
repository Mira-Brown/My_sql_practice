-- Lesson 1: Numeric data types and summary functions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Numeric types: integer (whole), numeric/decimal (exact, arbitrary precision),
-- real/double precision (floating point, approximate). Choose numeric for money.
--
-- Summary functions collapse many rows into one statistic:
--   min(), max(), avg(), sum(), count(), var_pop(), stddev()
--
-- Example — headline stats for Fortune-500 revenues:
SELECT min(revenues)  AS min_rev,
       avg(revenues)  AS avg_rev,
       max(revenues)  AS max_rev,
       stddev(revenues) AS sd_rev
FROM fortune500;
