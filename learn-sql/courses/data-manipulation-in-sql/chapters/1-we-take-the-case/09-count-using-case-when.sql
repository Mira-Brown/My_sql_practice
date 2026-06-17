-- Exercise: COUNT using CASE WHEN

;
-- Objective: Count home wins, away wins, and draws per season across all matches.
--
-- Instructions:
--   1. SELECT season.
--   2. Use COUNT with CASE WHEN to create three columns:
--        home_wins  — matches where home_goal > away_goal
--        away_wins  — matches where away_goal > home_goal
--        draws      — matches where home_goal = away_goal
--   3. GROUP BY season.
--   4. ORDER BY season.

SELECT
    season,
    COUNT(CASE WHEN home_goal > away_goal THEN 1 END) AS home_wins,
    COUNT(CASE WHEN away_goal > home_goal THEN 1 END) AS away_wins,
    COUNT(CASE WHEN home_goal = away_goal THEN 1 END) AS draws
FROM match
GROUP BY season
ORDER BY season;