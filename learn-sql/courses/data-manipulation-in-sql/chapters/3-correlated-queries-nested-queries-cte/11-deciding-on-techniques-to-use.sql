-- Lesson 11: Deciding on techniques to use (Video ▶)
-- Chapter 3 — Correlated Queries, Nested Queries, and CTEs
-- XP: 50

-- You now have four tools: simple subqueries, correlated subqueries,
-- nested subqueries, and CTEs. Here is when to reach for each one.

-- SIMPLE SUBQUERY
-- Use when: the inner result is a single value or list used by the outer query
-- Runs: once
-- Example: WHERE home_goal > (SELECT AVG(home_goal) FROM match)

-- CORRELATED SUBQUERY
-- Use when: the inner result must change per row of the outer query
-- Runs: once per row (slow on large tables — use sparingly)
-- Example: WHERE home_goal > (SELECT AVG(home_goal) FROM match AS i
--                              WHERE i.season = m.season)

-- NESTED SUBQUERY
-- Use when: you need to aggregate an aggregation (e.g. avg of averages)
-- Runs: inside-out, each layer once
-- Example: WHERE goals > (SELECT AVG(s) FROM (SELECT AVG(...) AS s ...) AS t)

-- CTE
-- Use when: a subquery is complex, reused, or you want readable top-down logic
-- Runs: once, result cached for the query duration
-- Example: WITH stats AS (...) SELECT ... FROM stats WHERE ...

-- Decision flowchart:
--   Need per-row context?          → correlated subquery
--   Aggregating an aggregation?    → nested subquery
--   Reusing logic / want clarity?  → CTE
--   Simple filter or scalar value? → simple subquery
