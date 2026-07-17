-- Lesson 9: More summary functions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Beyond min/max/avg:
--   * corr(y, x)                     — Pearson correlation of two columns
--   * var_pop() / var_samp()         — variance
--   * stddev_pop() / stddev_samp()   — standard deviation
--   * percentile_disc(p) WITHIN GROUP (ORDER BY col) — the p-th percentile
--       (percentile_disc returns an actual value; percentile_cont interpolates)
--
-- Example — correlation between revenues and profits:
SELECT corr(revenues, profits) AS rev_profit_corr
FROM fortune500;
