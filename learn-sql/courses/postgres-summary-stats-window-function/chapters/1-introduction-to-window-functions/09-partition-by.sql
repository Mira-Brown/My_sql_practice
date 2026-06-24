-- Lesson 9: PARTITION BY
-- Type: Video (50 XP)
-- Engine: PostgreSQL — psql -d postgres_summary_stats

-- PARTITION BY splits the window into independent groups.
-- ROW_NUMBER() restarts from 1 within each partition.
-- Syntax: ROW_NUMBER() OVER (PARTITION BY col ORDER BY col2)

-- Without PARTITION BY: one continuous count across all genders
-- With PARTITION BY gender: Men restart at 1, Women restart at 1
SELECT
    gender,
    year,
    ROW_NUMBER() OVER (PARTITION BY gender ORDER BY year) AS row_n
FROM (SELECT DISTINCT gender, year FROM summer_medals) AS y
ORDER BY gender, year;
