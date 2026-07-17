-- Lesson 9: Split strings on a delimiter
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- split_part(string, delimiter, n) returns the n-th field. evanston311 categories
-- look like 'Broad Group - Specific Type'; split on ' - ' to separate them.
--
-- Example — the specific type (2nd part) of each category:
SELECT category, split_part(category, ' - ', 2) AS specific_type
FROM evanston311
LIMIT 5;

-- Exercise: Split strings on a delimiter
-- Objective: Count requests by their broad category group (the text BEFORE the
--            first ' - ').
-- Instructions:
--   1. split_part(category, ' - ', 1) as the group.
--   2. count(*) per group, ordered descending, limit 10.

-- TODO: write your query below
SELECT split_part(category, ' - ', 1) AS category_group, count(*) AS n
FROM evanston311
GROUP BY split_part(category, ' - ', 1)
ORDER BY n DESC
LIMIT 10;
