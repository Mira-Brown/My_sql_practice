-- Lesson 10: Aggregating with date/time series
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Grouping only produces rows for periods that HAVE data — gaps vanish silently.
-- To show every period (including zero-activity ones):
--   1. generate_series(start::timestamp, stop, '1 day'/'1 month' interval) — the
--      complete spine of periods.
--   2. LEFT JOIN your aggregated data onto the spine.
--   3. coalesce(count, 0) to fill the gaps.
--
-- Example — the spine of every day in Jan 2017:
SELECT generate_series('2017-01-01'::timestamp, '2017-01-31', '1 day') AS day;
