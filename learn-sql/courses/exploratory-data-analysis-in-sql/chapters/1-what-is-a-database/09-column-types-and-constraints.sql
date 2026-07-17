-- Lesson 9: Column types and constraints
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Every column has a data type (integer, numeric, varchar, text, timestamp)
-- that determines what operations are valid. Constraints (NOT NULL, UNIQUE,
-- CHECK, PK, FK) restrict the values a column may hold.
--
-- Inspect the declared types of the fortune500 columns:
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'fortune500'
ORDER BY ordinal_position;

-- fortune500 CHECK constraints in the DDL: employees > 0, assets > 0.
-- Types matter: revenues is int, profits/assets/equity are numeric,
-- revenues_change/profits_change are real (floating point).
