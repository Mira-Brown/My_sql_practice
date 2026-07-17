-- Lesson 10: Correlation
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- corr(y, x) returns a value in [-1, 1]: near 1 = strong positive relationship,
-- near 0 = none, near -1 = strong negative.
--
-- Example — do assets and revenues move together?
SELECT corr(assets, revenues) AS assets_rev
FROM fortune500;

-- Exercise: Correlation
-- Objective: Compare three correlations against profits in one row.
-- Instructions:
--   1. corr(profits, revenues), corr(profits, assets), corr(profits, equity).
--   2. Alias each meaningfully.

-- TODO: write your query below
SELECT corr(profits, revenues) AS profits_revenues,
       corr(profits, assets)   AS profits_assets,
       corr(profits, equity)   AS profits_equity
FROM fortune500;
