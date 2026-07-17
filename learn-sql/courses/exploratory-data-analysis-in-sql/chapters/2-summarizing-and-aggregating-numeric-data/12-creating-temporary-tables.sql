-- Lesson 12: Creating temporary tables
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- A TEMP (temporary) table exists only for your database session and is dropped
-- automatically when you disconnect. Use it to save intermediate results so
-- later queries stay short and readable.
--
--   CREATE TEMP TABLE name AS   -- from a query
--   SELECT ...;
--
--   CREATE TEMP TABLE name (    -- empty, then INSERT
--     col type, ...
--   );
--
-- Example:
CREATE TEMP TABLE profit50 AS
SELECT title, sector, profits
FROM fortune500
WHERE profits > 5000;
-- Now query the small temp table:
SELECT sector, count(*) FROM profit50 GROUP BY sector;
