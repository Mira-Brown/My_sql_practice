-- Exercise: Numbering Olympic athletes by medals earned
-- Objective: Rank athletes by their total medal count across all years,
--            most decorated athlete = row 1.
-- Instructions:
--   1. Select athlete and the count of medals, aliased as medals.
--   2. Assign a row number ordered by medal count descending, aliased as row_n.
--   3. Group by athlete.
--   4. Order the final output by medals descending.

SELECT
    athlete,
    COUNT(*) AS medals,
    ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS row_n
FROM summer_medals
GROUP BY athlete
ORDER BY medals DESC;
