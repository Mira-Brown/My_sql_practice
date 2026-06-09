-- Exercise: Calling all set operators
-- Objective: Use UNION ALL, INTERSECT, and EXCEPT across the economies tables.
--
-- Instructions:
--   Part 1 — UNION ALL
--     Select code, year, income_group FROM economies2015
--     UNION ALL
--     Select code, year, income_group FROM economies2019
--     ORDER BY code, year
--
--   Part 2 — INTERSECT
--     Find codes that appear in BOTH economies2015 AND economies2019
--     ORDER BY code
--
--   Part 3 — EXCEPT
--     Find codes in economies2015 that do NOT appear in economies2019
--     ORDER BY code

-- TODO: Part 1 — UNION ALL
SELECT code, year, income_group
FROM economies2015
UNION ALL 
SELECT code, year, income_group
FROM economies2019
ORDER BY code, year;

-- TODO: Part 2 — INTERSECT
SELECT code
FROM economies2015
INTERSECT
SELECT code
FROM economies2019
ORDER BY code;

-- TODO: Part 3 — EXCEPT
SELECT code
FROM economies2015
EXCEPT
SELECT code
FROM economies2019
ORDER BY code;
