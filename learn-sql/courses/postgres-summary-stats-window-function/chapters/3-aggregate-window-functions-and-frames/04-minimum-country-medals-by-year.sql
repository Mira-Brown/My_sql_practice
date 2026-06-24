-- Lesson 4: Minimum country medals by year
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Minimum country medals by year
-- Objective: For each year France competed, show how many gold medals
--            France won AND the running minimum — the lowest single-year
--            count seen so far up to that year.
--
-- Instructions:
--   1. Filter to country = 'FRA' AND medal = 'Gold'.
--   2. Group by country and year; count medals per year as medals.
--   3. Add a min_medals column using MIN() as a window function,
--      partitioned by country, ordered by year.
--   4. Return country, year, medals, min_medals.
--   5. Order by year.

SELECT
    country, year,
    COUNT(*) AS medals,
    MIN(COUNT(*)) OVER (PARTITION BY country ORDER BY year) AS min_medals
FROM summer_medals
WHERE country = 'FRA' AND medal = 'Gold'
GROUP BY country, year
ORDER BY year;
