-- Lesson 4: Last country by name
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Exercise: Last country by name
-- Objective: Use LAST_VALUE to show, on every row, which country comes LAST
--            alphabetically among gold medal winners in the same year and gender group.
--
-- Instructions:
--   1. Select year, gender, country from summer_medals.
--   2. Filter to gold medals only.
--   3. Add a LAST_VALUE column aliased as last_country:
--      the country that comes last alphabetically within the same year and gender.
--      PARTITION BY year, gender — ORDER BY country.
--      Use frame: ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--   4. Order final output by year, gender, country.

SELECT
    year, gender, country,
    LAST_VALUE(country) OVER (
            PARTITION BY year, gender
            ORDER BY country
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS last_country
FROM summer_medals
WHERE
    medal = 'Gold'
ORDER BY
    year, gender, country;
