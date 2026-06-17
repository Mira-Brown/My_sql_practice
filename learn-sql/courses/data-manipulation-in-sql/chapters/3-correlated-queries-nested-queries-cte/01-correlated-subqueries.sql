-- Lesson 1: Correlated subqueries (Video ▶)
-- Chapter 3 — Correlated Queries, Nested Queries, and CTEs
-- XP: 50

-- A simple subquery runs ONCE — its result is a fixed value passed to the outer query.
-- A CORRELATED subquery runs once FOR EACH ROW of the outer query.
-- It references a column from the outer query, so each row gets its own subquery result.

-- Pattern:
--   SELECT col
--   FROM outer_table AS o
--   WHERE col > (
--       SELECT AVG(col)
--       FROM outer_table AS i
--       WHERE i.group_col = o.group_col   -- <-- the correlation
--   );

-- Example: Find every match where home goals exceeded the AVERAGE home goals
-- for that specific season (not the global average across all seasons).

SELECT
    m.id,
    m.season,
    m.home_goal
FROM match AS m
WHERE m.home_goal > (
    SELECT AVG(i.home_goal)
    FROM match AS i
    WHERE i.season = m.season   -- ties inner query to outer row's season
);
