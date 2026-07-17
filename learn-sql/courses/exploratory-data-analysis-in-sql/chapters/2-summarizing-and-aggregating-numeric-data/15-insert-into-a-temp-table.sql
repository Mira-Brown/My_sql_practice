-- Lesson 15: Insert into a temp table
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Create an empty temp table, then INSERT INTO ... SELECT to fill it — possibly
-- from several sources in stages.
--
-- Example:
CREATE TEMP TABLE sector_summary (
    sector text,
    avg_profit numeric
);
INSERT INTO sector_summary
SELECT sector, avg(profits)
FROM fortune500
GROUP BY sector;

-- Exercise: Insert into a temp table
-- Objective: Build a temp table of average revenues by sector, in two steps.
-- Instructions:
--   1. CREATE TEMP TABLE sector_rev (sector text, avg_rev numeric);
--   2. INSERT INTO it a SELECT of sector, avg(revenues) grouped by sector.
--   3. SELECT * ordered by avg_rev descending.

-- TODO: write your query below
CREATE TEMP TABLE sector_rev (sector text, avg_rev numeric);

INSERT INTO sector_rev
SELECT sector, avg(revenues)
FROM fortune500
GROUP BY sector;

SELECT * FROM sector_rev ORDER BY avg_rev DESC;
