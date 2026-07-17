-- Lesson 1: Date/time types and formats
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- PostgreSQL date/time types:
--   * date                       — calendar date, no time
--   * timestamp                  — date + time, no zone
--   * timestamp with time zone   — date + time, zone-aware (evanston311 uses this)
--   * interval                   — a DURATION (e.g. '2 days 03:00:00')
--
-- Literals are written as strings and cast: DATE '2017-01-01', now(),
-- current_date. Subtracting two timestamps yields an interval.
--
-- Example — the earliest and latest request timestamps:
SELECT min(date_created) AS first_request,
       max(date_created) AS last_request
FROM evanston311;
