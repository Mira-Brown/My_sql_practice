-- Exercise: Using CASE and AVG to derive fractions
-- Objective: Calculate the percentage of home wins, away wins, and draws per season.
--
-- Instructions:
--   1. SELECT season.
--   2. Use AVG with CASE WHEN to produce three columns (round each to 2 decimal places):
--        pct_home_wins  — % of matches where home_goal > away_goal
--        pct_away_wins  — % of matches where away_goal > home_goal
--        pct_draws      — % of matches where home_goal = away_goal
--   3. Multiply each AVG by 100 to express as a percentage.
--   4. GROUP BY season, ORDER BY season.
--
-- Pattern: ROUND(AVG(CASE WHEN <condition> THEN 1 ELSE 0 END) * 100, 2)

SELECT
    season,
    ROUND(AVG(CASE WHEN home_goal > away_goal THEN 1 ELSE 0 END) * 100, 2) AS pct_home_wins,
    ROUND(AVG(CASE WHEN away_goal > home_goal THEN 1 ELSE 0 END) * 100, 2) AS pct_away_wins,
    ROUND(AVG(CASE WHEN home_goal = away_goal THEN 1 ELSE 0 END) * 100, 2) AS pct_draws
FROM match
GROUP BY season
ORDER BY season;

