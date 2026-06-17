-- Lesson 8: Subqueries in SELECT
-- Type: Video ▶ (50 XP)
--
-- A subquery in SELECT adds a calculated column to every row.
-- Must return exactly one value (scalar). Alias it with AS.
--
-- Example: append the global average goals to every match row

SELECT
    id,
    home_goal,
    away_goal,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg
FROM match
LIMIT 5;

-- Result: every row shows the same overall_avg (2.73) alongside its own goals.
-- Useful for computing differences: home_goal - overall_avg AS vs_average
