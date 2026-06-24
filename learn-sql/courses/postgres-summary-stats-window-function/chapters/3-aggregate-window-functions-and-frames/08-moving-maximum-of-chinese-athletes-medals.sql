-- Lesson 8: Moving maximum of Chinese athletes' medals
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Moving maximum of Chinese athletes' medals
-- Objective: Same pattern as L7, now targeting Chinese athletes (CHN).
--            Use a 3-row moving maximum partitioned by athlete.
--
-- Instructions:
--   1. Use a CTE called Chinese_Medals that:
--      - Filters to country = 'CHN' AND medal = 'Gold'
--      - Groups by athlete and year
--      - Returns athlete, year, COUNT(*) AS medals
--   2. In the final SELECT:
--      - Return athlete, year, medals
--      - Add Max_Medals: MAX(medals) OVER partitioned by athlete,
--        ordered by year, frame = ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--   3. Order by athlete, year.

WITH Chinese_Medals AS (
    SELECT athlete, year, 
    COUNT(*) AS medals
    FROM summer_medals
    WHERE country = 'CHN' AND medal = 'Gold'
    GROUP BY athlete, year
)
SELECT
    athlete, year, medals,
    MAX(medals) OVER (PARTITION BY athlete ORDER BY year 
                      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Max_Medals
FROM Chinese_Medals
ORDER BY athlete, year;
