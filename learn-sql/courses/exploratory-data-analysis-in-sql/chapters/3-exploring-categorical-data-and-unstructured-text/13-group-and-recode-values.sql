-- Lesson 13: Group and recode values
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- A recode temp table maps many raw values to a few standard ones. Join to apply.
--
-- Example — map broad category groups to a tidy label:
CREATE TEMP TABLE recode AS
SELECT DISTINCT category AS raw,
       split_part(category, ' - ', 1) AS standard
FROM evanston311;

-- Exercise: Group and recode values
-- Objective: Using the recode temp table, count requests per standardized group.
-- Instructions:
--   1. Join evanston311 to recode on category = raw.
--   2. Count per recode.standard.
--   3. Order by count descending, limit 10.

-- TODO: write your query below
SELECT r.standard, count(*) AS n
FROM evanston311 AS e
JOIN recode AS r ON e.category = r.raw
GROUP BY r.standard
ORDER BY n DESC
LIMIT 10;
