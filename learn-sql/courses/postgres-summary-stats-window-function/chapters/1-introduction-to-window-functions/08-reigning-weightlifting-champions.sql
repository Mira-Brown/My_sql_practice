-- Exercise: Reigning weightlifting champions
-- Objective: Find the most recent Gold medal winner in the
--            Men's +105KG Weightlifting event.
-- Instructions:
--   1. In a subquery aliased as weightlifting, select athlete and year,
--      and assign ROW_NUMBER() ordered by year DESC as row_n.
--      Filter to: sport = 'Weightlifting', event = 'Super-Heavyweight',
--                 gender = 'Men', medal = 'Gold'.
--   2. In the outer query, select athlete and year.
--   3. Filter the outer query to row_n = 1.

SELECT athlete, year
FROM (
    SELECT
        athlete,
        year,
        ROW_NUMBER() OVER(ORDER BY year DESC) AS row_n
    FROM summer_medals
    WHERE sport = 'Weightlifting'
      AND event = '+105KG'
      AND gender = 'Men'
      AND medal = 'Gold'
) AS weightlifting
WHERE row_n = 1;
