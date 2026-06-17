-- Lesson 7: Common Table Expressions (Video ▶)
-- Chapter 3 — Correlated Queries, Nested Queries, and CTEs
-- XP: 50

-- A Common Table Expression (CTE) is a named subquery defined BEFORE the main query
-- using the WITH keyword. It behaves like a temporary table that exists only for
-- the duration of the query.

-- Syntax:
--   WITH cte_name AS (
--       SELECT ...
--       FROM ...
--   )
--   SELECT ...
--   FROM cte_name;

-- Compare: the nested subquery from Lesson 6 rewritten as a CTE:

-- Nested version (harder to read):
-- SELECT country_id, season, avg_goals
-- FROM (
--     SELECT country_id, season, AVG(home_goal + away_goal) AS avg_goals
--     FROM match
--     GROUP BY country_id, season
-- ) AS match_stats
-- ORDER BY country_id, season;

-- CTE version (same result, much easier to read):
WITH match_stats AS (
    SELECT
        country_id,
        season,
        AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY country_id, season
)
SELECT
    country_id,
    season,
    avg_goals
FROM match_stats
ORDER BY country_id, season;
