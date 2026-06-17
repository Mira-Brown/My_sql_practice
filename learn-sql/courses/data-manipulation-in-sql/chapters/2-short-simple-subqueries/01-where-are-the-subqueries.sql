-- Lesson 1: WHERE are the Subqueries?
-- Type: Video ▶ (50 XP)
-- Dataset: data-manipulation-in-sql (European Soccer)
--
-- A subquery is a query nested inside another query.
-- In WHERE, a scalar subquery (returns one value) replaces a hardcoded constant.
-- Use = or >/< for single values; use IN for a list.
--
-- Example: matches where home goals beat the overall average

SELECT id, season, home_goal, away_goal
FROM match
WHERE home_goal > (SELECT AVG(home_goal) FROM match)
LIMIT 10;

-- What does the inner query return on its own?
SELECT AVG(home_goal) FROM match;
