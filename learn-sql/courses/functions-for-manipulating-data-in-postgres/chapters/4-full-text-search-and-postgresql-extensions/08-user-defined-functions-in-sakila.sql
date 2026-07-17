-- Lesson 8: User-defined functions in Sakila
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- The same way pg_type describes custom types, information_schema.routines
-- describes all functions defined in the database — including those loaded
-- by extensions like fuzzystrmatch and pg_trgm.
--
-- Key columns:
--   routine_name   — the function name
--   routine_type   — 'FUNCTION' or 'PROCEDURE'
--   data_type      — the return type
--   routine_schema — the schema it lives in (we want 'public')
--
-- Exercise: Find the text-manipulation functions available in sakila
-- Objective: Query information_schema.routines to list functions whose names
--            match the key functions we'll use in the next two lessons.
--Solution

SELECT
    routine_name,
    data_type
FROM information_schema.routines
WHERE
    routine_schema = 'public'
    AND routine_type = 'FUNCTION'
    AND routine_name IN ('levenshtein', 'soundex', 'metaphone', 'similarity')
ORDER BY routine_name
;
