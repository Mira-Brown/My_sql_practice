-- Lesson 11: Subqueries everywhere! And best practices!
-- Type: Video ▶ (50 XP)
--
-- Subquery placement summary:
--   WHERE  → scalar or list, for filtering rows
--   FROM   → table (must alias), aggregate first then filter/join
--   SELECT → scalar only, appends a global constant to each row
--
-- Best practices:
--   1. Indent inner queries for readability
--   2. Run the inner query alone first to verify output
--   3. Prefer JOINs over WHERE subqueries when both work
--   4. SELECT subqueries run once per row — use FROM subqueries for performance
--   5. Use descriptive aliases (match_stats, season_avgs, diff)
--
-- All three placements in one query:

SELECT
    c.name,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg,
    AVG(m.home_goal + m.away_goal)
        - (SELECT AVG(home_goal + away_goal) FROM match) AS diff
FROM match AS m
JOIN country AS c ON m.country_id = c.id
WHERE m.country_id IN (
    SELECT id FROM country WHERE name LIKE '%land%'
)
GROUP BY c.name
ORDER BY diff DESC;
