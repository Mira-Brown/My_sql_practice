-- Exercise: Clean up with CTEs
-- Objective: Rewrite a nested subquery as a CTE to improve readability.
--            Find all matches where total goals exceeded the overall average
--            total goals across all matches.
-- Instructions:
--   1. Define a CTE called match_avg with one column: avg_goals
--      computed as AVG(home_goal + away_goal) FROM match
--   2. In the main query, SELECT id, season, home_goal, away_goal FROM match
--   3. Filter WHERE (home_goal + away_goal) > the avg_goals value from match_avg
--      (use a subquery: SELECT avg_goals FROM match_avg)

-- TODO: write the CTE and main query below
WITH match_avg AS (
    SELECT AVG(home_goal + away_goal) AS avg_goals
    FROM match
)
SELECT id, season, home_goal, away_goal
FROM match
WHERE (home_goal + away_goal) > (SELECT avg_goals FROM match_avg);
 
