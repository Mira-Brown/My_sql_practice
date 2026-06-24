-- Lesson 11: Moving average of Russian medals
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Exercise: Moving average of Russian medals
-- Objective: Compute a 3-year moving average of gold medals won by Russia
--            across Olympic years.
--
-- Instructions:
--   1. Use a CTE called Russian_Medals that:
--      - Filters to country = 'RUS' AND medal = 'Gold'
--      - Groups by country and year
--      - Returns year and COUNT(*) AS medals
--   2. In the final SELECT:
--      - Return year, medals
--      - Add Moving_Average: AVG(medals) OVER ordered by year,
--        frame = ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--        Round to 2 decimal places.
--   3. Order by year.

WITH Russian_Medals AS (
    SELECT year, 
    COUNT(*) AS medals
    FROM summer_medals
    WHERE country = 'RUS' AND medal = 'Gold'
    GRoup BY country, year
)
SELECT
    year, medals,
    ROUND(AVG(medals) OVER (ORDER BY year
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ), 2) AS Moving_Average
FROM Russian_Medals
ORDER BY year;
