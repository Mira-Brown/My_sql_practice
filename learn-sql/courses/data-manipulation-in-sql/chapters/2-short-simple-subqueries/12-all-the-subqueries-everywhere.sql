-- Exercise: ALL the subqueries EVERYWHERE
-- Objective: Use subqueries in WHERE, FROM, and SELECT in a single query.
--
-- Instructions:
--   1. In SELECT: select country.name, and add a subquery column that returns
--      the overall AVG(home_goal + away_goal) across all matches, aliased AS overall_avg.
--   2. In FROM: use a subquery that calculates AVG(home_goal + away_goal) AS avg_goals
--      per country_id from match, grouped by country_id. Alias it AS match_stats.
--   3. JOIN match_stats to the country table on country_id = country.id.
--   4. In WHERE: filter to only rows where match_stats.avg_goals > the overall average.
--      Use another scalar subquery for the overall average.
--   5. Order by avg_goals DESC.

SELECT
    country.name,
    match_stats.avg_goals,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg
FROM (
    SELECT country_id, AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY country_id
) AS match_stats
JOIN country ON match_stats.country_id = country.id
WHERE match_stats.avg_goals > (
    SELECT AVG(home_goal + away_goal) FROM match
)
ORDER BY avg_goals DESC;
