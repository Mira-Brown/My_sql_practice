-- Lesson 6: Exploring unstructured text
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Free-text columns (description) hold information no category captures. Search
-- them with LIKE (case-sensitive) or ILIKE (case-insensitive) and % wildcards.
--
-- Example — requests mentioning 'trash' anywhere in the description:
SELECT count(*)
FROM evanston311
WHERE description ILIKE '%trash%';

-- Exercise: Exploring unstructured text
-- Objective: Count requests whose description mentions 'graffiti', regardless of
--            case, and compare to the graffiti category count.
-- Instructions:
--   1. count(*) WHERE description ILIKE '%graffiti%'.
--   2. Also count WHERE category ILIKE '%graffiti%' for comparison.

-- TODO: write your query below
SELECT count(*) FILTER (WHERE description ILIKE '%graffiti%') AS in_description,
       count(*) FILTER (WHERE category    ILIKE '%graffiti%') AS in_category
FROM evanston311;
