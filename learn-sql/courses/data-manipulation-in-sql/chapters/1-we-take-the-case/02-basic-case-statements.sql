-- Exercise: Basic CASE statements
-- Objective: Use CASE to label each match with its outcome from the home team's perspective.
--
-- Instructions:
--   1. SELECT the match id, country_id, season, home_goal, and away_goal columns.
--   2. Add a CASE expression that returns:
--        'Home win'  when home_goal > away_goal
--        'Away win'  when home_goal < away_goal
--        'Draw'      otherwise
--   3. Alias the CASE result as outcome.
--   4. No WHERE clause — return all rows.

SELECT
     id, country_id, season, home_goal, away_goal,
     CASE WHEN  home_goal > away_goal THEN 'Home win'
          WHEN  home_goal < away_goal THEN 'Away win'
          ELSE 'Draw' 
     END AS outcome
FROM match;
