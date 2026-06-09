-- Exercise: Comparing two set operations
-- Objective: See how UNION and UNION ALL produce different row counts on the same data.
--
-- Instructions:
--   1. SELECT country AND continent FROM prime_ministers
--      UNION ALL
--      SELECT country AND continent FROM monarchs
--      ORDER BY country
--
--   2. Run the same query replacing UNION ALL with UNION.
--      Note the row count difference.

-- TODO: Part 1 — UNION ALL
SELECT country, continent
FROM prime_ministers
UNION ALL
SELECT country, continent
FROM monarchs
ORDER BY country;

-- TODO: Part 2 — UNION
SELECT country, continent
FROM prime_ministers
UNION 
SELECT country, continent
FROM monarchs
ORDER BY country;
