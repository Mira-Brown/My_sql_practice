-- Lesson 2: Explore table sizes
-- Type: Exercise </> (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- COUNT(*) tells you how many observations (rows) a table holds — the first
-- thing to check when exploring an unfamiliar database.
--
-- Example — rows in the company table:
SELECT count(*) FROM company;

-- Exercise: Explore table sizes
-- Objective: Get the row count of every table in one result set.
-- Instructions:
--   1. UNION ALL a SELECT count(*) for each table.
--   2. Label each with a literal table name so the output is readable.

-- TODO: write your query below
SELECT 'evanston311'  AS table, count(*) FROM evanston311
UNION ALL SELECT 'fortune500',   count(*) FROM fortune500
UNION ALL SELECT 'company',      count(*) FROM company
UNION ALL SELECT 'tag_company',  count(*) FROM tag_company
UNION ALL SELECT 'tag_type',     count(*) FROM tag_type
UNION ALL SELECT 'stackoverflow',count(*) FROM stackoverflow;
