-- Lesson 7: Getting info about user-defined data types
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Now that we can find user-defined types, let's inspect their details.
--
-- For ENUMs — pg_enum holds each allowed value:
--   pg_enum.enumtypid  → links back to pg_type.oid
--   pg_enum.enumlabel  → the actual string value ('G', 'PG', etc.)
--   pg_enum.enumsortorder → the display order
--
-- For DOMAINs — information_schema.domains shows the underlying base type:
--   domain_name, data_type (the base type), domain_schema
--
-- Exercise: List all allowed values of the mpaa_rating enum
-- Objective: JOIN pg_enum to pg_type to retrieve each label for mpaa_rating,
--            in the correct display order.
--
-- Instructions:
--   1. Select enumlabel (aliased as rating) and typname (aliased as type_name)
--      from pg_enum aliased as e.
--   2. JOIN pg_type aliased as t ON e.enumtypid = t.oid.
--   3. Filter to only the 'mpaa_rating' type (typname = 'mpaa_rating').
--   4. Order by e.enumsortorder ascending.

SELECT
    e.enumlabel AS rating, 
    t.typname AS type_name
FROM pg_enum AS e
    JOIN pg_type AS t ON e.enumtypid = t.oid
WHERE
    t.typname = 'mpaa_rating' 
ORDER BY enumsortorder
;
