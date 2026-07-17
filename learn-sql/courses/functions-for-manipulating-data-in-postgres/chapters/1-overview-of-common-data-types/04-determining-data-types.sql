-- Lesson 4: Determining data types
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB
--
-- information_schema.columns also exposes character_maximum_length,
-- so you can filter by data type AND inspect size limits in one query.
--

-- Exercise: Determining data types
-- Objective: Find all columns in the `rental` table that store date or
--            time information.
-- Instructions:
--   1. SELECT column_name and data_type
--   2. FROM information_schema.columns
--   3. WHERE table_name = 'rental'
--   4. AND data_type contains 'date' OR 'time'
--      (hint: LIKE '%date%' and LIKE '%time%' — mind the AND/OR precedence)
--   5. ORDER BY ordinal_position

-- TODO: write your query below
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'rental'
AND (data_type LIKE '%date%' OR 
data_type LIKE '%time%')
ORDER BY ordinal_position;