-- Lesson 12: Moving total of countries' medals
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Moving total of countries' medals
-- Objective: For each of three countries (USA, GBR, CHN), compute a
--            3-year moving total of gold medals, partitioned by country.
--
-- Instructions:
--   1. Use a CTE called Country_Medals that:
--      - Filters to country IN ('USA', 'GBR', 'CHN') AND medal = 'Gold'
--      - Groups by country and year
--      - Returns country, year, COUNT(*) AS medals
--   2. In the final SELECT:
--      - Return country, year, medals
--      - Add Moving_Total: SUM(medals) OVER partitioned by country,
--        ordered by year, frame = ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--   3. Order by country, year.

WITH Country_Medals AS (
    SELECT country, year, 
    COUNT(*) AS medals
    FROM summer_medals
    WHERE country IN ('USA','GBR', 'CHN') AND medal = 'Gold' 
    GROUP BY country, year
)
SELECT
    country, year, medals,
    SUM(medals) OVER (PARTITION BY country ORDER BY year 
                      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Total
FROM Country_Medals
ORDER BY country, year;
