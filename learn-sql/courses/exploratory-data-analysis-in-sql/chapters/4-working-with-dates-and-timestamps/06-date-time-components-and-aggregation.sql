-- Lesson 6: Date/time components and aggregation
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Pull a piece out of a timestamp to aggregate by it:
--   * date_part('field', ts)  or  EXTRACT(field FROM ts)
--       fields: year, month, day, hour, dow (day-of-week 0=Sun), doy
--   * to_char(ts, 'format')  — formatted text, e.g. to_char(ts, 'Day'), 'Month'
--   * date_trunc('unit', ts) — zero out everything below unit (keeps a timestamp)
--
-- Example — requests by hour of day:
SELECT date_part('hour', date_created) AS hour, count(*)
FROM evanston311
GROUP BY hour
ORDER BY hour;
