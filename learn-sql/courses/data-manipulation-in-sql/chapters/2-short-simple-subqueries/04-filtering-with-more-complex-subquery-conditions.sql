-- Exercise: Filtering with more complex subquery conditions
-- Objective: Combine a scalar subquery and a list subquery in one WHERE clause.
--
-- Instructions:
--   1. Select id, season, home_goal, and away_goal from match.
--   2. Filter to matches that meet BOTH conditions:
--      a. The home team is a 'United' club (team_long_name LIKE '%United%').
--         Use IN with a subquery on team.team_api_id — same as Lesson 3.
--      b. The total goals scored (home_goal + away_goal) are greater than
--         the average total goals across ALL matches.
--         Use a scalar subquery — same as Lesson 2.
--   3. Use AND to combine both conditions.

SELECT
    id, season, home_goal, away_goal
FROM match
WHERE hometeam_id IN (
    SELECT team_api_id FROM team WHERE team_long_name LIKE '%United%'
)
AND (home_goal + away_goal) > (
  SELECT AVG(home_goal + away_goal) FROM match
);
