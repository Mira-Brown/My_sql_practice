-- Lesson 10: Shorten long strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Truncate long free text for display with left(str, n), then append an ellipsis
-- when the original was longer.
--
-- Example — description preview:
SELECT left(description, 40) ||
       CASE WHEN length(description) > 40 THEN '...' ELSE '' END AS preview
FROM evanston311
WHERE description IS NOT NULL
LIMIT 5;

-- Exercise: Shorten long strings
-- Objective: Show a 50-character preview of description with '...' when truncated,
--            for requests longer than 100 characters.
-- Instructions:
--   1. left(description, 50) plus a conditional '...'.
--   2. Filter to length(description) > 100.
--   3. Limit 10.

-- TODO: write your query below
SELECT left(description, 50) ||
       CASE WHEN length(description) > 50 THEN '...' ELSE '' END AS preview
FROM evanston311
WHERE length(description) > 100
LIMIT 10;
