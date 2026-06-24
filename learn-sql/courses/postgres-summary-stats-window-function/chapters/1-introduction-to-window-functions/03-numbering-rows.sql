-- Exercise: Numbering rows
-- Objective: Use ROW_NUMBER() to assign a sequential number to each
--            Summer Olympic Games in chronological order.
-- Instructions:
--   1. Select the distinct years from summer_medals, subqueried and aliased as y.
--   2. Assign a row number to each year, ordered by year ascending.
--   3. Alias the row number column as row_n.
--   4. Order the final results by year ascending.

SELECT
    year,
    ROW_NUMBER() OVER (ORDER BY year)  AS row_n
FROM (SELECT DISTINCT year FROM summer_medals) AS y
ORDER BY year ASC;
