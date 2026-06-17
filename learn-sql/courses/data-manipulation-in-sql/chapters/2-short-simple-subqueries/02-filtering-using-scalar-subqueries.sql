-- Exercise: Filtering using scalar subqueries
-- Objective: Use a subquery inside WHERE to filter match rows dynamically.
--
-- Instructions:
--   1. Calculate the average number of goals scored (home + away combined)
--      per match across the entire dataset. This is your scalar subquery.
--   2. Select the match id, country_id, season, home_goal, and away_goal
--      from match.
--   3. Filter to only matches where the total goals scored in that match
--      (home_goal + away_goal) are greater than the average total goals.

SELECT
    id, country_id, season, home_goal, away_goal
FROM match
WHERE (home_goal + away_goal) > (
    SELECT AVG(home_goal + away_goal) FROM match
);
