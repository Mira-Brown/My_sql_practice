-- Lesson 5: In CASE things get more complex
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer)

-- CASE WHEN conditions can use AND / OR to test multiple things at once.
-- This lets you create labels that depend on more than one column.
--
-- Example — classify matches by both result AND goal volume:
--
--   A "high-scoring home win" requires TWO things to be true:
--     1. home_goal > away_goal  (home won)
--     2. home_goal + away_goal >= 5  (lots of goals)
--
-- Combine them with AND inside a single WHEN:

SELECT
    id,
    home_goal,
    away_goal,
    CASE WHEN home_goal > away_goal AND home_goal + away_goal >= 5
              THEN 'High-scoring home win'
         WHEN home_goal > away_goal
              THEN 'Home win'
         WHEN home_goal = away_goal
              THEN 'Draw'
         ELSE 'Away win'
    END AS match_type
FROM match
LIMIT 10;

-- You can also use OR to catch either of two conditions:
--
--   WHEN home_goal >= 4 OR away_goal >= 4 THEN 'Goal fest'
--
-- Rules stay the same: first matching WHEN wins, more specific conditions go first.
