-- Lesson 1: Introduction
-- Type: Video (50 XP)
-- Engine: PostgreSQL — psql -d postgres_summary_stats
--
-- Window functions annotate rows without collapsing them.
-- Syntax: function_name() OVER (...)
-- The OVER clause defines the "window" (set of rows the function sees).
--
-- Compare: GROUP BY collapses → window function keeps every row.
--
-- Example A: GROUP BY — one row per year, row detail lost
SELECT year, COUNT(*) AS medals
FROM summer_medals
GROUP BY year
ORDER BY year;

-- Example B: ROW_NUMBER() window function — all rows preserved, each gets a number
SELECT
    year,
    athlete,
    medal,
    ROW_NUMBER() OVER (ORDER BY year) AS row_n
FROM summer_medals
WHERE medal = 'Gold'
  AND sport = 'Athletics'
ORDER BY year
LIMIT 15;
