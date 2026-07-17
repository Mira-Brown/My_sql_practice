-- Lesson 14: Time between events
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- To measure the gap between consecutive events, order the rows by time and look
-- at the previous/next timestamp with window functions:
--   * lead(ts)  OVER (ORDER BY ts) — the NEXT event's time
--   * lag(ts)   OVER (ORDER BY ts) — the PREVIOUS event's time
-- Subtract to get the interval between them. The largest such interval is the
-- longest quiet gap.
--
-- Example — gap to the next request for a sample:
SELECT date_created,
       lead(date_created) OVER (ORDER BY date_created) - date_created AS gap
FROM evanston311
ORDER BY date_created
LIMIT 5;
