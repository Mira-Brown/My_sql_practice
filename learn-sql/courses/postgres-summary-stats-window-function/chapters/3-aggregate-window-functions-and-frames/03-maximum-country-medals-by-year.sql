-- Lesson 3: Maximum country medals by year
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Maximum country medals by year
-- Objective: For each year, show how many gold medals China won AND
--            what the highest single-year gold medal count has been
--            so far (i.e. the running maximum up to that year).
--
-- Instructions:
--   1. Filter to country = 'CHN' AND medal = 'Gold'.
--   2. Group by country and year; count medals per year as medals.
--   3. Add a max_medals column using MAX() as a window function,
--      partitioned by country, ordered by year.
--   4. Return country, year, medals, max_medals.
--   5. Order by year.

SELECT
    country, year,
    COUNT(*) AS medals,
    MAX(COUNT(*)) OVER (PARTITION BY country ORDER BY year) AS max_medals
FROM summer_medals
WHERE country = 'CHN' AND medal = 'Gold'
GROUP BY country, year
ORDER BY year;
