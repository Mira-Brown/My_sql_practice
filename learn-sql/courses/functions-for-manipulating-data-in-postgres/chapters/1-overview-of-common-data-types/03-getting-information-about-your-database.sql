-- Lesson 3: Getting information about your database
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- PostgreSQL stores metadata about your tables and columns in a special
-- built-in schema called information_schema. The key view is:
--   information_schema.columns
--
-- Useful columns in that view:
--   table_name   — name of the table
--   column_name  — name of the column
--   data_type    — the SQL data type (e.g. 'character varying', 'text', 'smallint')
--
-- Example — all columns in the actor table with their data types:
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'actor';

-- Exercise: Getting information about your database
-- Objective: Use information_schema.columns to inspect the film table
-- Instructions:
--   1. SELECT column_name and data_type
--   2. FROM information_schema.columns
--   3. WHERE table_name is 'film'
--   4. ORDER BY ordinal_position  (keeps columns in their original table order)

-- TODO: write your query below
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film'
ORDER BY ordinal_position;