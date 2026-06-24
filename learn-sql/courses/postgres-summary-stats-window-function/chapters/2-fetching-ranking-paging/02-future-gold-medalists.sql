-- Lesson 2: Future gold medalists
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Future gold medalists
-- Objective: Use LEAD to show, for each row, which athlete wins gold in the SAME event
--            at the NEXT Olympic Games.
--
-- Instructions:
--   1. Select year, event, gender, and athlete from summer_medals.
--   2. Filter to gold medals and discipline = 'Artistic G.'
--   3. Add a LEAD column aliased as future_champion:
--      the athlete who wins gold in the same event next Olympics.
--      PARTITION BY event, ORDER BY year.
--   4. Order final output by event, gender, year.

SELECT
    event, gender, athlete,
    LEAD(athlete) OVER (PARTITION BY event ORDER BY year) AS future_champion
FROM summer_medals
WHERE
    medal = 'Gold'
    AND discipline = 'Artistic G.'
ORDER BY
    event, gender, year;
