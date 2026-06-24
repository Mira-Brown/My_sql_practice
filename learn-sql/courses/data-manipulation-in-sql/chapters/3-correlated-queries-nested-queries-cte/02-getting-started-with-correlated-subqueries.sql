-- Exercise: Getting started with correlated subqueries
-- Objective: Use a correlated subquery to find matches where home goals
--            exceeded the average home goals for that country.
-- Instructions:
--   1. SELECT id, country_id, season, home_goal, away_goal FROM match AS m
--   2. Add a WHERE clause with a correlated subquery that compares m.home_goal
--      to the AVG(home_goal) from match for the same country_id
--   3. The inner query must alias match as i and reference m.country_id

SELECT
    m.id,
    m.country_id,
    m.season,
    m.home_goal,
    m.away_goal
FROM match AS m
WHERE m.home_goal > (
    SELECT AVG(home_goal) 
    FROM match AS i
    WHERE i.country_id = m.country_id
);
