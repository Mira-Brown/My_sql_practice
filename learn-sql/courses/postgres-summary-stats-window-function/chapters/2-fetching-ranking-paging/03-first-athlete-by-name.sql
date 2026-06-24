-- Lesson 3: First athlete by name
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: First athlete by name
-- Objective: Use FIRST_VALUE to show, on every row, who is the first athlete
--            alphabetically to win gold within each year and gender group.
--
-- Instructions:
--   1. Select year, gender, athlete from summer_medals.
--   2. Filter to gold medals only.
--   3. Add a FIRST_VALUE column aliased as first_champion:
--      the athlete who comes first alphabetically within the same year and gender.
--      PARTITION BY year AND gender, ORDER BY athlete.
--   4. Order final output by year, gender, athlete.

SELECT
    year, gender, athlete,
    FIRST_VALUE(athlete) OVER (PARTITION BY year, gender ORDER BY athlete) AS first_champion
FROM summer_medals
WHERE
     medal = 'Gold'
ORDER BY
     year, gender, athlete;
