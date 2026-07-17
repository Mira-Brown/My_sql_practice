-- Lesson 8: Coalesce
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- COALESCE returns the first non-NULL argument. Use it to supply a fallback
-- value or to collapse a hierarchy of columns into one.
--
-- Example — use the industry, or fall back to sector, or 'Unknown':
SELECT coalesce(industry, sector, 'Unknown') AS bucket, count(*)
FROM fortune500
GROUP BY bucket
ORDER BY count DESC
LIMIT 5;

-- Exercise: Coalesce
-- Objective: Count Fortune-500 companies per sector, but replace any NULL
--            sector with the label 'Unknown'.
-- Instructions:
--   1. COALESCE(sector, 'Unknown') as the grouping column.
--   2. count(*) per group, ordered by count descending.

-- TODO: write your query below
SELECT coalesce(sector, 'Unknown') AS sector, count(*) AS n
FROM fortune500
GROUP BY coalesce(sector, 'Unknown')
ORDER BY n DESC;
