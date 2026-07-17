-- Lesson 7: Ranking athletes from multiple countries
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Ranking athletes from multiple countries
-- Objective: Rank athletes from Russia, China, and USA globally by their
--            total gold medal count using DENSE_RANK (no partition — one shared rank).
--
-- Instructions:
--   1. Select country, athlete, COUNT(*) AS medals.
--   2. Filter to gold medals and country IN ('CHN', 'RUS', 'USA').
--   3. GROUP BY country, athlete.
--   4. Add DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank.
--      No PARTITION BY — rank is global across all three countries.
--   5. Order final output by rank, athlete.

SELECT
    country, athlete, COUNT(*) AS medals,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM summer_medals
WHERE
     medal = 'Gold' AND
    country IN ('CHN', 'RUS', 'USA')
GROUP BY
    country, athlete
ORDER BY
    rank, athlete;

