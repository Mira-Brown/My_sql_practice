-- Exercise: Joining Subqueries in FROM
-- Objective: Build a FROM subquery and JOIN it to another table.
--
-- Instructions:
--   1. Write a subquery in FROM that calculates, per country_id:
--        - the total number of matches played (COUNT(*) AS total_matches)
--        - the average total goals per match (AVG(home_goal + away_goal) AS avg_goals)
--      Group by country_id. Alias the subquery AS match_stats.
--   2. JOIN match_stats to the country table on country_id = country.id.
--   3. Select country.name, match_stats.total_matches, and match_stats.avg_goals
--      from the outer query.
--   4. Order by avg_goals DESC.

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
ORDER BY avg_goals DESC;
