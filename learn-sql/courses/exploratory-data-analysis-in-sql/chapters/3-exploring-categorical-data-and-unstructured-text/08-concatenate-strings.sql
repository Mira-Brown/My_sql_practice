-- Lesson 8: Concatenate strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- || joins strings; NULL || anything = NULL, so coalesce parts that may be NULL.
--
-- Example — a safe concatenated address:
SELECT coalesce(house_num, '') || ' ' || coalesce(street, '') AS address
FROM evanston311
LIMIT 5;

-- Exercise: Concatenate strings
-- Objective: Produce a label of the form "<category>: <first 30 chars of
--            description>" for the 10 most recent requests.
-- Instructions:
--   1. Concatenate category, ': ', and left(description, 30).
--   2. Order by date_created descending, limit 10.

-- TODO: write your query below
SELECT category || ': ' || left(description, 30) AS label
FROM evanston311
WHERE description IS NOT NULL
ORDER BY date_created DESC
LIMIT 10;
