-- Lesson 17: Wrap-up
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- You explored a PostgreSQL database end to end:
--   Ch1 — tables, keys, joins, missing values, COALESCE, casting
--   Ch2 — numeric summaries, division, distributions, correlation, temp tables
--   Ch3 — cleaning messy categorical text, splitting/concatenating, recoding
--   Ch4 — dates, intervals, components, time series with gaps, gaps between events
--
-- The EDA playbook: know the schema -> check completeness -> summarize numerics
-- -> tidy categoricals -> profile over time. Every technique here is reusable on
-- any new dataset you meet.
--
-- Final sanity check — the shape of what you analyzed:
SELECT (SELECT count(*) FROM evanston311)  AS evanston_requests,
       (SELECT count(*) FROM fortune500)   AS fortune500_companies,
       (SELECT count(*) FROM stackoverflow) AS stackoverflow_rows;
