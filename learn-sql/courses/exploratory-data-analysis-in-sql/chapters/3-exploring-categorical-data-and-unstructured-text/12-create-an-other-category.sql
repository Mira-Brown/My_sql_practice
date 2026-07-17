-- Lesson 12: Create an 'other' category
-- Type: Exercise </> (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Rare categories add noise. Roll any category below a count threshold into
-- 'Other' with a CASE expression driven by a windowed or subqueried count.
--
-- Example — categories with fewer than 100 requests become 'Other':
SELECT CASE WHEN cnt < 100 THEN 'Other' ELSE category END AS category, sum(cnt)
FROM (SELECT category, count(*) AS cnt FROM evanston311 GROUP BY category) AS c
GROUP BY CASE WHEN cnt < 100 THEN 'Other' ELSE category END
ORDER BY sum DESC;

-- Exercise: Create an "other" category
-- Objective: Keep the top categories; group everything with under 50 requests
--            into 'Other'.
-- Instructions:
--   1. Subquery: count requests per category.
--   2. CASE WHEN count < 50 THEN 'Other' ELSE category END.
--   3. Sum the counts per resulting label, order descending.

-- TODO: write your query below
SELECT CASE WHEN cnt < 50 THEN 'Other' ELSE category END AS category,
       sum(cnt) AS n
FROM (SELECT category, count(*) AS cnt FROM evanston311 GROUP BY category) AS c
GROUP BY CASE WHEN cnt < 50 THEN 'Other' ELSE category END
ORDER BY n DESC;
