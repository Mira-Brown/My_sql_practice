-- Lesson 13: Create a temp table
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- CREATE TEMP TABLE ... AS SELECT snapshots a query's result into a reusable
-- table for the rest of your session.
--
-- Example — top-quartile companies by revenues:
CREATE TEMP TABLE top_rev AS
SELECT title, revenues
FROM fortune500
WHERE revenues > (SELECT percentile_disc(0.75) WITHIN GROUP (ORDER BY revenues)
                  FROM fortune500);

-- Exercise: Create a temp table
-- Objective: Save the highest-employee companies into a temp table, then query it.
-- Instructions:
--   1. CREATE TEMP TABLE big_employers AS SELECT title, sector, employees
--      FROM fortune500 with employees above the 90th percentile.
--   2. Then SELECT sector, count(*) from the temp table grouped by sector.

-- TODO: write your query below
CREATE TEMP TABLE big_employers AS
SELECT title, sector, employees
FROM fortune500
WHERE employees > (SELECT percentile_disc(0.9) WITHIN GROUP (ORDER BY employees)
                   FROM fortune500);

SELECT sector, count(*) AS n
FROM big_employers
GROUP BY sector
ORDER BY n DESC;
