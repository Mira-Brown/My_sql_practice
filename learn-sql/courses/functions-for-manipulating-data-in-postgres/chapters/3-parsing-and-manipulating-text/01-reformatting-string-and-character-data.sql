-- Lesson 1: Reformatting string and character data
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Key functions:
--   UPPER(text)           → all caps
--   LOWER(text)           → all lowercase
--   INITCAP(text)         → Title Case (first letter of every word)
--   CONCAT(a, b, ...)     → join strings (or use the || operator)
--   REPLACE(text, from, to) → substitute characters

-- Mini-example: actor names are stored as UPPER in sakila.
-- Let's reformat them into title-case "Firstname Lastname" labels.

SELECT
    actor_id,
    first_name,
    last_name,
    INITCAP(first_name) || ' ' || INITCAP(last_name)  AS full_name,
    LOWER(first_name || last_name)                     AS username,
    REPLACE(last_name, 'A', '@')                       AS silly_replace
FROM actor
LIMIT 10;
