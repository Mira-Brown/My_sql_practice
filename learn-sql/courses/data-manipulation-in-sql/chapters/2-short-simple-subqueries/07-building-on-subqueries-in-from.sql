-- Exercise: Building on Subqueries in FROM
-- Objective: Extend the FROM subquery to add a filter on the aggregated result.
--
-- Instructions:
--   1. Start with the same subquery as Lesson 6:
--      count of matches and avg total goals per country_id, aliased AS match_stats.
--   2. JOIN match_stats to country on country_id = country.id.
--   3. Select country.name, match_stats.total_matches, match_stats.avg_goals.
--   4. This time, only show countries where avg_goals > 2.75.
--      (Filter in the outer WHERE — not inside the subquery.)
--   5. Order by avg_goals DESC.

SELECT
    country.name, match_stats.total_matches, match_stats.avg_goals
FROM (
    SELECT country_id,
    COUNT(*) AS total_matches,
    AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY country_id
) AS match_stats
JOIN country ON match_stats.country_id = country.id
WHERE avg_goals > 2.75
ORDER BY avg_goals DESC;
