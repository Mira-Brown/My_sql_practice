-- Lesson 7: Moving maximum of Scandinavian athletes' medals
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Moving maximum of Scandinavian athletes' medals
-- Objective: For each Scandinavian athlete (SWE, NOR, DEN), compute
--            a 3-row moving maximum of their gold medal counts by year.
--
-- Instructions:
--   1. Use a CTE called Scandinavian_Medals that:
--      - Filters to country IN ('SWE', 'NOR', 'DEN') AND medal = 'Gold'
--      - Groups by athlete and year
--      - Returns athlete, year, COUNT(*) AS medals
--   2. In the final SELECT from that CTE:
--      - Return athlete, year, medals
--      - Add Max_Medals: MAX(medals) as a window function
--        partitioned by athlete, ordered by year,
--        with a frame of 2 PRECEDING to CURRENT ROW
--   3. Order by athlete, year.

WITH Scandinavian_Medals AS (
    SELECT athlete, year,
    COUNT(*) AS medals
    FROM summer_medals
    WHERE country IN ('SWE', 'NOR', 'DEN') AND
    medal = 'Gold'
    GROUP BY athlete, year 
)
SELECT
    athlete, year, medals,
    MAX(medals) OVER (PARTITION BY athlete ORDER BY year
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Max_Medals
FROM Scandinavian_Medals
ORDER BY athlete, year;
