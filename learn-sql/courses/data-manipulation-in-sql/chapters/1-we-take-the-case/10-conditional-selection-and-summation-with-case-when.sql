-- Exercise: Conditional selection and summation with CASE WHEN
-- Objective: For each season, calculate total goals scored in home wins
--            and total goals scored in away wins separately.
--
-- Instructions:
--   1. SELECT season.
--   2. Use SUM with CASE WHEN to create two columns:
--        home_win_goals — sum of ALL goals (home + away) in matches where home team won
--        away_win_goals — sum of ALL goals (home + away) in matches where away team won
--   3. GROUP BY season.
--   4. ORDER BY season.
--
-- Note: "all goals" means home_goal + away_goal for that match.
--       Use ELSE 0 so non-matching rows contribute zero to the sum.

SELECT
    season,
    SUM(CASE WHEN home_goal > away_goal THEN home_goal + away_goal ELSE 0 END) AS home_win_goals,
    SUM(CASE WHEN away_goal > home_goal THEN home_goal + away_goal ELSE 0 END) AS away_win_goals
FROM match
GROUP BY season
ORDER BY season;
;
