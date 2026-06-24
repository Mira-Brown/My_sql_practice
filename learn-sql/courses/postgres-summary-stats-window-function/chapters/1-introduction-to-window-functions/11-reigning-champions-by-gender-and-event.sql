-- Exercise: Reigning champions by gender and event
-- Objective: Find the most recent Gold medal winner for every
--            gender-event combination in Athletics.
-- Instructions:
--   1. In a subquery aliased as athletics, select gender, event, athlete, year.
--      Assign ROW_NUMBER() partitioned by gender AND event, ordered by year DESC,
--      aliased as row_n.
--      Filter to: sport = 'Athletics', medal = 'Gold'.
--   2. In the outer query, select gender, event, athlete, and year.
--   3. Filter to row_n = 1 and order by gender, event.

SELECT gender, event, athlete, year
FROM (
    SELECT
        gender,
        event,
        athlete,
        year,
        ROW_NUMBER() OVER (PARTITION BY gender, event ORDER BY year DESC) AS row_n
    FROM summer_medals
    WHERE sport = 'Athletics'
      AND medal = 'Gold'
) AS athletics
WHERE row_n = 1
ORDER BY gender, event;
