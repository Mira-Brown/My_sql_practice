-- Exercise: Numbering Olympic games in ascending order
-- Objective: Number the Olympic games in which at least one medal was awarded
--            in the discipline 'Weightlifting', in ascending chronological order.
-- Instructions:
--   1. In a subquery aliased as y, select the distinct years from summer_medals
--      where discipline = 'Weightlifting'.
--   2. In the outer query, select year and assign a row number ordered by year
--      ascending, aliased as row_n.
--   3. Order the final results by year ascending.

SELECT
    year,
    ROW_NUMBER() OVER (ORDER BY year) As row_n
FROM (
       SELECT DISTINCT year FROM su WHERE discipline = 'Weightlifting'
) AS y
ORDER BY year ASC;
