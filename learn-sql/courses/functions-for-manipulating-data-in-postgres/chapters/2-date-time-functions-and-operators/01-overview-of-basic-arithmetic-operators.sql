-- Lesson 1: Overview of basic arithmetic operators
-- Type: Video ▶ (50 XP) ✅
-- Engine: PostgreSQL — Sakila DB

-- DATE/TIME arithmetic operators:
--   DATE + INTEGER         → DATE        (shift by N days)
--   DATE - DATE            → INTEGER     (days between)
--   TIMESTAMP - TIMESTAMP  → INTERVAL    (exact gap)
--   TIMESTAMP + INTERVAL   → TIMESTAMP   (shift precisely)

-- Mini-example: how long was a rental?
SELECT
    rental_id,
    rental_date,
    return_date,
    return_date - rental_date AS rental_duration
FROM rental
LIMIT 5;
