-- Lesson 11: Mean and Median
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- The mean (avg) is pulled by outliers; the median (50th percentile) is not.
-- A large gap between them signals a skewed distribution.
--
-- Example — mean vs median revenues:
SELECT avg(revenues) AS mean,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY revenues) AS median
FROM fortune500;

-- Exercise: Mean and Median
-- Objective: Compare mean and median of assets to gauge skew.
-- Instructions:
--   1. avg(assets) as mean.
--   2. percentile_disc(0.5) WITHIN GROUP (ORDER BY assets) as median.

-- TODO: write your query below
SELECT avg(assets) AS mean_assets,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY assets) AS median_assets
FROM fortune500;
