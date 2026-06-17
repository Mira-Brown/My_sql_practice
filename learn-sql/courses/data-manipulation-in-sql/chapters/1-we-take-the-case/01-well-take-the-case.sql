-- Lesson 1: We'll take the CASE
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer)

-- CASE is SQL's conditional expression — like an if/else inside a query.
-- It lets you classify rows into labels based on column values.
--
-- Syntax:
--   CASE WHEN <condition> THEN <value>
--        WHEN <condition> THEN <value>
--        ELSE <default>
--   END
--
-- Rules:
--   - Conditions are tested top to bottom; the first TRUE match wins.
--   - ELSE catches anything that didn't match. Without it, unmatched rows get NULL.
--   - END closes the expression. You can alias it with AS.
--   - CASE can go in SELECT, WHERE, ORDER BY, or aggregate functions.
--
-- Example — label every match outcome for the home team:

SELECT
    id,
    home_goal,
    away_goal,
    CASE WHEN home_goal > away_goal THEN 'home win'
         WHEN home_goal < away_goal THEN 'away win'
         ELSE 'draw'
    END AS outcome
FROM match
LIMIT 10;
