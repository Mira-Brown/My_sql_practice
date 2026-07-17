-- Lesson 14: Create a table with indicator variables
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Indicator (dummy) variables are 0/1 or boolean flags derived from text, ready
-- for downstream analysis. Build them with CASE or boolean expressions.
--
-- Example — flag whether a description mentions certain keywords:
SELECT id,
       CASE WHEN description ILIKE '%trash%' THEN 1 ELSE 0 END AS mentions_trash,
       CASE WHEN description ILIKE '%rat%'   THEN 1 ELSE 0 END AS mentions_rat
FROM evanston311
LIMIT 5;

-- Exercise: Create a table with indicator variables
-- Objective: For each request, add indicators for whether the description
--            mentions 'graffiti' and whether priority is 'HIGH'.
-- Instructions:
--   1. Indicator ind_graffiti = 1 when description ILIKE '%graffiti%'.
--   2. Indicator ind_high = 1 when priority = 'HIGH'.
--   3. Return id plus both indicators for 10 rows.

-- TODO: write your query below
SELECT id,
       CASE WHEN description ILIKE '%graffiti%' THEN 1 ELSE 0 END AS ind_graffiti,
       CASE WHEN priority = 'HIGH'             THEN 1 ELSE 0 END AS ind_high
FROM evanston311
LIMIT 10;
