-- Exercise: Numbering Olympic games in descending order
-- Objective: Number all Summer Olympic games newest-first (2012 = 1, 1896 = 27),
--            but display the results in ascending year order.
-- Instructions:
--   1. In a subquery aliased as y, select the distinct years from summer_medals.
--   2. Assign a row number ordered by year descending, aliased as row_n.
--   3. Order the final output by year ascending.

SELECT
    year,
    ROW_NUMBER() OVER(ORDER BY year DESC) AS row_n
FROM (SELECT DISTINCT year FROM summer_medals) AS y
ORDER BY year ASC;