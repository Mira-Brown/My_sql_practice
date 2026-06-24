-- Lesson 5: ORDER BY
-- Type: Video (50 XP)
-- Engine: PostgreSQL — psql -d postgres_summary_stats

-- ORDER BY inside OVER() controls how the window function sequences rows.
-- ORDER BY at the end of the query controls the output display order.
-- They are independent of each other.

-- Row numbers descend (newest game = 1) but output rows appear oldest-first:
SELECT
    year,
    ROW_NUMBER() OVER (ORDER BY year DESC) AS row_n
FROM (SELECT DISTINCT year FROM summer_medals) AS y
ORDER BY year ASC;
