-- Lesson 3: Changing the case of string data
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Standardise film and actor names
-- Objective: Use UPPER(), LOWER(), and INITCAP() to control text case.
--
-- Instructions:
--   1. From the film table, select title and description.
--   2. Add a column called title_upper — the title in ALL CAPS.
--   3. Add a column called title_lower — the title in all lowercase.
--   4. Add a column called title_initcap — the title in Title Case.
--   5. From the actor table (separate query), select first_name and last_name.
--      Build a column called display_name formatted as:
--      "Lastname, Firstname"  in Title Case  (e.g. "Guiness, Penelope")
--      Hint: INITCAP() each name, then concatenate with ', ' in between.
--   6. Limit both queries to 10 rows.

-- Query 1: film titles in three cases
SELECT
    title,
    description,
    UPPER(title) AS title_upper,
    LOWER(title) AS title_lower,
    INITCAP(title) AS title_initcap
FROM film
LIMIT 10;

-- Query 2: actor display names
SELECT
    first_name,
    last_name,
    INITCAP(last_name) || ', ' || INITCAP(first_name) AS display_name
FROM actor
LIMIT 10;
