-- Exercise: Correlated subquery with multiple conditions
-- Objective: Use a correlated subquery with TWO correlation conditions to
--            find matches where home goals exceeded the average for that
--            country AND that season combined.
-- Instructions:
--   1. SELECT id, country_id, season, home_goal, away_goal FROM match AS m
--   2. In the WHERE clause, write a correlated subquery that computes
--      AVG(home_goal) from match AS i
--   3. Correlate on TWO columns: i.country_id = m.country_id
--                            AND i.season = m.season

SELECT
    m.id,
    m.country_id,
    m.season,
    m.home_goal,
    m.away_goal
FROM match AS m
WHERE m.home_goal > (
    SELECT AVG(home_goal) FROM match AS i
    WHERE i.country_id = m.country_id
  AND i.season = m.season
);
