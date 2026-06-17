-- ============================================================
-- CAPSTONE — Chapter 1: We Take the CASE
-- ============================================================
-- Scenario: A football analyst wants a season-level performance
-- summary across the whole dataset. They need one row per season
-- showing:
--
--   1. Total matches played
--   2. Number of home wins, away wins, and draws
--   3. Total goals scored in home wins (home + away goals combined)
--   4. Total goals scored in away wins (home + away goals combined)
--   5. Percentage of matches that were high-scoring (5+ total goals)
--
-- Requirements:
--   - SELECT season
--   - total_matches    : COUNT(*) — all matches
--   - home_wins        : COUNT with CASE WHEN home team won
--   - away_wins        : COUNT with CASE WHEN away team won
--   - draws            : COUNT with CASE WHEN it was a draw
--   - home_win_goals   : SUM of (home_goal + away_goal) in home wins, ELSE 0
--   - away_win_goals   : SUM of (home_goal + away_goal) in away wins, ELSE 0
--   - pct_high_scoring : ROUND(AVG(CASE WHEN total goals >= 5 THEN 1 ELSE 0 END)*100, 2)
--   - GROUP BY season, ORDER BY season
--
-- All seven computed columns in one query. No JOINs needed — match table only.
-- ============================================================

-- Write your query below:
SELECT
    season,
    COUNT(*)                                                                    AS total_matches,
    COUNT(CASE WHEN home_goal > away_goal THEN 1 END)                          AS home_wins,
    COUNT(CASE WHEN away_goal > home_goal THEN 1 END)                          AS away_wins,
    COUNT(CASE WHEN home_goal = away_goal THEN 1 END)                          AS draws,
    SUM(CASE WHEN home_goal > away_goal THEN home_goal + away_goal ELSE 0 END) AS home_win_goals,
    SUM(CASE WHEN away_goal > home_goal THEN home_goal + away_goal ELSE 0 END) AS away_win_goals,
    ROUND(AVG(CASE WHEN home_goal + away_goal >= 5 THEN 1 ELSE 0 END) * 100, 2) AS pct_high_scoring
FROM match
GROUP BY season
ORDER BY season;