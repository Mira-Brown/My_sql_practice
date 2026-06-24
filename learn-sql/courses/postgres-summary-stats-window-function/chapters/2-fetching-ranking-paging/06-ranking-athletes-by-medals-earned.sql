-- Lesson 6: Ranking athletes by medals earned
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Ranking athletes by medals earned
-- Objective: Rank athletes within each country by their total gold medal count
--            using DENSE_RANK.
--
-- Instructions:
--   1. Select country, athlete, and a COUNT of rows aliased as medals.
--   2. Filter to gold medals only.
--   3. GROUP BY country and athlete.
--   4. Add a DENSE_RANK column aliased as rank:
--      rank athletes by medals descending, partitioned by country.
--   5. Order final output by country, rank, athlete.

SELECT
    country, athlete, COUNT(*) AS medals,
    DENSE_RANK() OVER (PARTITION BY country ORDER BY COUNT(*) DESC ) AS rank
FROM summer_medals
WHERE
    medal = 'Gold'
GROUP BY
    country, athlete
ORDER BY
    country, rank, athlete;
