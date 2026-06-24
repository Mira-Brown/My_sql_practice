-- Lesson 10: Paging events
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Paging events
-- Objective: Split all distinct disciplines into 3 equal pages, ordered alphabetically.
--
-- Instructions:
--   1. Write a subquery that selects DISTINCT discipline from summer_medals. Alias it as disciplines.
--   2. In the outer query, select discipline and NTILE(3) OVER (ORDER BY discipline) AS page.
--   3. Order final output by page, discipline.

SELECT
    discipline,
    NTILE(3) OVER (ORDER BY discipline) AS page
FROM (
    SELECT DISTINCT discipline FROM summer_medals
) AS disciplines
ORDER BY
    page, discipline;
