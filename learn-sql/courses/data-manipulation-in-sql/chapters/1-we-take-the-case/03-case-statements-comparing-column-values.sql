-- Exercise: CASE statements comparing column values
-- Objective: Identify matches where the home team scored 3+ more goals than the away team.
--
-- Instructions:
--   1. SELECT the match id and season.
--   2. Add a CASE expression aliased as home_performance that returns:
--        'Dominant'   when home_goal >= away_goal + 3   (home scored 3+ more)
--        'Won'        when home_goal > away_goal         (home won by less)
--        'Draw'       when home_goal = away_goal
--        'Lost'       otherwise
--   3. No WHERE clause — return all rows.

SELECT
     id, season,
     CASE WHEN home_goal >= away_goal + 3 THEN 'Dominant'
          WHEN home_goal > away_goal THEN 'Won'
          WHEN home_goal = away_goal THEN 'Draw'
          ELSE 'Lost'
     END AS home_performance
FROM match;
