-- Exercise: Filtering using a subquery with a list
-- Objective: Use IN with a subquery that returns multiple rows to filter matches.
--
-- Instructions:
--   1. The hometeam_id column in match links to team.team_api_id (not team.id).
--   2. Write a subquery that returns the team_api_id of every team whose
--      team_long_name contains the word 'United'.
--   3. Select the id, hometeam_id, and season from match.
--   4. Filter to only matches where the home team is one of those 'United' clubs.

SELECT
    id, hometeam_id, season
FROM match
WHERE hometeam_id IN (
    SELECT team_api_id FROM team WHERE team_long_name LIKE '%United%' 
);
