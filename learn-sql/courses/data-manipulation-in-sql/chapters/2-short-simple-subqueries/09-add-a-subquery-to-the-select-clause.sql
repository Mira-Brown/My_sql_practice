-- Exercise: Add a subquery to the SELECT clause
-- Objective: Append a global average as a calculated column to each row.
--
-- Instructions:
--   1. Select country_id and AVG(home_goal + away_goal) AS avg_goals
--      from match, grouped by country_id.
--   2. Add a second column in SELECT: the overall average goals per match
--      across the ENTIRE match table (not per country) — use a subquery.
--      Alias it AS overall_avg.
--   3. No WHERE or HAVING needed.

SELECT
    country_id,
    AVG(home_goal + away_goal) AS avg_goals,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg
FROM match
GROUP BY country_id;
