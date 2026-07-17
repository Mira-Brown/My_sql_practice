-- Lesson 6: User-defined data types
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- PostgreSQL lets you define custom types beyond the built-ins (TEXT, INTEGER, etc.).
-- Two kinds are used in sakila:
--   ENUM   (typtype = 'e') — a fixed set of allowed string values
--                            e.g. mpaa_rating: 'G', 'PG', 'PG-13', 'R', 'NC-17'
--   DOMAIN (typtype = 'd') — a constraint wrapper around an existing type
--                            e.g. year: an INTEGER restricted to 1901-2155
--
-- The system catalog pg_type stores every type PostgreSQL knows about.
-- pg_namespace maps type namespaces to schema names (we want 'public').
--
-- Exercise: Find user-defined types in the sakila database
-- Objective: Query pg_type to list the ENUMs and DOMAINs defined in the public schema.
--
-- Solution

SELECT
    typname, typtype
FROM pg_type
    JOIN pg_namespace ON pg_type.typnamespace = pg_namespace.oid
WHERE
    nspname = 'public'   
    AND typtype IN ('e', 'd')
ORDER BY typname
;
