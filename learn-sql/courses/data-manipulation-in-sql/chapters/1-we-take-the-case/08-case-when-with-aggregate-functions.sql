-- Lesson 8: CASE WHEN with aggregate functions
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer)

-- You can wrap CASE inside COUNT() or SUM() to count or sum only
-- rows that match a condition — without a separate subquery or filter.
--
-- The trick: CASE returns a value when the condition is true, NULL otherwise.
-- COUNT() ignores NULLs — so it only counts the matching rows.
--
--   COUNT(CASE WHEN home_goal > away_goal THEN 1 END)
--   → returns 1 for home wins, NULL for everything else → COUNT tallies only wins
--
-- SUM() works the same way:
--   SUM(CASE WHEN home_goal > away_goal THEN home_goal ELSE 0 END)
--   → adds up home goals only in matches the home team won
--
-- Example — count home wins, away wins, and draws per season:

SELECT
    season,
    COUNT(CASE WHEN home_goal > away_goal THEN 1 END) AS home_wins,
    COUNT(CASE WHEN away_goal > home_goal THEN 1 END) AS away_wins,
    COUNT(CASE WHEN home_goal = away_goal THEN 1 END) AS draws
FROM match
GROUP BY season
ORDER BY season;

-- Result:
-- season     | home_wins | away_wins | draws
-- 2011/2012  |   1498    |    904    |  818
-- 2012/2013  |   1444    |    963    |  853
-- 2013/2014  |   1404    |    892    |  736
-- 2014/2015  |   1494    |    981    |  850
--
-- Three separate counts, one pass over the data — no JOINs, no subqueries.
