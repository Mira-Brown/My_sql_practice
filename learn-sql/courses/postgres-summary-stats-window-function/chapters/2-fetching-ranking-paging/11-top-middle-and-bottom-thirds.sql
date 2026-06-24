-- Lesson 11: Top, middle, and bottom thirds
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Top, middle, and bottom thirds
-- Objective: Split athletes from the 2000 Olympics into thirds by gold medals,
--            then label each tier 'Top', 'Middle', or 'Bottom'.
--
-- Instructions:
--   1. First CTE (athlete_medals): count gold medals per athlete for year = 2000.
--      Columns: athlete, medals.
--   2. Second CTE (thirds): select athlete, medals, and
--      NTILE(3) OVER (ORDER BY medals DESC) AS third  from athlete_medals.
--   3. Outer query: select athlete, medals, and a CASE on third:
--        1 → 'Top'
--        2 → 'Middle'
--        3 → 'Bottom'
--      alias the CASE column as third.
--   4. Order by medals DESC.

WITH athlete_medals AS (
     SELECT athlete, COUNT(*) AS medals
           FROM summer_medals
           WHERE year = 2000 AND medal = 'Gold'
           GROUP BY athlete
),
thirds AS (
     SELECT athlete, medals,
                  NTILE(3) OVER (ORDER BY medals DESC) AS third
           FROM athlete_medals
)
SELECT
     athlete, medals,
     CASE WHEN third = 1 THEN 'Top'
            WHEN third = 2 THEN 'Middle'
            ELSE 'Bottom' END AS third
FROM thirds
ORDER BY
    medals DESC;
