-- Lesson 5: Functions for retrieving current date/time
-- Type: Video ▶ (50 XP) ✅
-- Engine: PostgreSQL — Sakila DB

-- NOW() / CURRENT_TIMESTAMP  → TIMESTAMPTZ (date + time + timezone)
-- CURRENT_DATE               → DATE (no time)
-- CURRENT_TIME               → TIMETZ (no date)
-- All are stable within a transaction — fixed at transaction start.

SELECT
    NOW()               AS now,
    CURRENT_TIMESTAMP   AS current_ts,
    CURRENT_DATE        AS current_date,
    CURRENT_TIME        AS current_time;
