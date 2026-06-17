-- ============================================================
-- CAPSTONE — Chapter 2: Short and Simple Subqueries
-- ============================================================
-- Scenario: You are a football analyst building a league performance
-- report. A club wants to know which leagues are high-scoring and
-- how their seasons compare to the global average.
--
-- Write a SINGLE query that does ALL of the following:
--
--   1. FROM subquery (alias: league_season):
--      For each combination of country_id and season, calculate:
--        - COUNT(*)                      AS total_matches
--        - AVG(home_goal + away_goal)    AS avg_goals
--        - SUM(home_goal)                AS total_home_goals
--        - SUM(away_goal)                AS total_away_goals
--      Source: match table, grouped by country_id, season.
--
--   2. JOIN league_season to the country table on country_id = country.id.
--
--   3. Outer SELECT columns:
--        - country.name
--        - league_season.season
--        - league_season.total_matches
--        - league_season.avg_goals
--        - A SELECT subquery: overall AVG(home_goal + away_goal)
--          across all matches, aliased AS overall_avg
--
--   4. WHERE: only include rows where avg_goals is greater than
--      the overall average (use another scalar subquery).
--
--   5. ORDER BY country.name ASC, season ASC.
--
-- Expected shape: one row per country-season that beats the global
-- average, showing name, season, match count, avg goals, and benchmark.
-- ============================================================

-- Write your query below:
SELECT
    country.name,
    league_season.season,
    league_season.total_matches, league_season.avg_goals,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg
FROM (     
    SELECT 
      country_id, season,
      COUNT(*)                      AS total_matches,
      AVG(home_goal + away_goal)    AS avg_goals,
      SUM(home_goal)                AS total_home_goals,
      SUM(away_goal)                AS total_away_goals  
      FROM match
      GROUP BY country_id, season
) AS league_season      
JOIN country ON  league_season.country_id = country.id
WHERE avg_goals > (SELECT AVG(home_goal + away_goal) FROM match)
ORDER BY country.name ASC, season ASC;     




   