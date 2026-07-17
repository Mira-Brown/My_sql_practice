-- Lesson 2: ISO 8601
-- Type: Exercise </> (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- ISO 8601 formats dates as YYYY-MM-DD and timestamps as YYYY-MM-DD HH:MI:SS,
-- from largest unit to smallest. This ordering sorts correctly as plain text and
-- is unambiguous across locales — always prefer it for literals.
--
-- Example — a well-formed ISO comparison:
SELECT count(*)
FROM evanston311
WHERE date_created >= '2017-01-01'
  AND date_created <  '2018-01-01';

-- Exercise: ISO 8601
-- Objective: Count requests created in the first quarter of 2017 using ISO
--            literals and a half-open interval.
-- Instructions:
--   1. date_created >= '2017-01-01' AND date_created < '2017-04-01'.
--   2. Return the count.

-- TODO: write your query below
SELECT count(*) AS q1_2017
FROM evanston311
WHERE date_created >= '2017-01-01'
  AND date_created <  '2017-04-01';
