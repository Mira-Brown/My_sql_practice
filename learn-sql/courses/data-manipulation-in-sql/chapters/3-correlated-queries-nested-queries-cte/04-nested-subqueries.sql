-- Lesson 4: Nested subqueries (Video ▶)
-- Chapter 3 — Correlated Queries, Nested Queries, and CTEs
-- XP: 50

-- A nested subquery is a subquery INSIDE another subquery.
-- Each layer runs independently (no correlation) — innermost first,
-- result passed outward, like peeling an onion from the inside.

-- Structure:
--   SELECT ...
--   FROM (
--       SELECT ...           -- middle subquery
--       FROM (
--           SELECT ...       -- innermost subquery (runs first)
--           FROM table
--       ) AS inner_alias
--   ) AS outer_alias;

-- Example: What is the average number of goals scored per match,
-- grouped by season — then what is the overall average of those season averages?

-- Step 1 (innermost): goals per match per season
-- Step 2 (outer):     average of those per-season averages

SELECT AVG(season_goals) AS avg_of_season_avgs
FROM (
    SELECT
        season,
        AVG(home_goal + away_goal) AS season_goals
    FROM match
    GROUP BY season
) AS season_avgs;
