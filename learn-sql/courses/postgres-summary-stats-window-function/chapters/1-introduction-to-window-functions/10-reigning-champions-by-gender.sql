-- Exercise: Reigning champions by gender
-- Objective: Find the most recent Gold medal winner in Discus Throw
--            for each gender.
-- Instructions:
--   1. In a subquery aliased as discus, select gender, athlete, and year.
--      Assign ROW_NUMBER() partitioned by gender and ordered by year DESC,
--      aliased as row_n.
--      Filter to: sport = 'Athletics', event = 'Discus Throw', medal = 'Gold'.
--   2. In the outer query, select gender, athlete, and year.
--   3. Filter to row_n = 1 and order by gender.

SELECT gender, athlete, year
FROM (
    SELECT
        gender,
        athlete,
        year,
        ROW_NUMBER() OVER (PARTITION BY gender ORDER BY year DESC) AS row_n
    FROM summer_medals
    WHERE sport = 'Athletics'
      AND event = 'Discus Throw'
      AND medal = 'Gold'
) AS discus
WHERE row_n = 1
ORDER BY gender;
