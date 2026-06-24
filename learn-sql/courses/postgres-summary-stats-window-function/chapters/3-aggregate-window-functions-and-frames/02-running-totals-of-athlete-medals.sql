-- Lesson 2: Running totals of athlete medals
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Running totals of athlete medals
-- Objective: Compute a running total of gold medals for athlete 'FELIX Allyson'
--            across Olympic years.
--
-- Instructions:
--   1. Filter to rows where athlete = 'FELIX Allyson' AND medal = 'Gold'.
--   2. Group by athlete and year; count medals per year.
--   3. Add a running_total column using SUM() as a window function,
--      partitioned by athlete, ordered by year.
--   4. Return athlete, year, medals (the per-year count), running_total.
--   5. Order the final result by year.

SELECT
    athlete, year,
    COUNT(*) AS medals,
    SUM(COUNT(*)) OVER (PARTITION BY athlete ORDER BY year) AS running_total
FROM summer_medals
WHERE athlete = 'FELIX Allyson' AND medal = 'Gold'
GROUP BY athlete, year
ORDER BY year;
