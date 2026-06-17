-- A subquery is a query nested inside another query.
-- In WHERE, a scalar subquery (returns one value) replaces a hardcoded constant.
-- Use = or >/< for single values; use IN for a list.
--
-- Example: matches where home goals beat the overall average

SELECT id, season, home_goal, away_goal
FROM match
WHERE home_goal > (SELECT AVG(home_goal) FROM match)
LIMIT 10;

-- What does the inner query return on its own?
SELECT AVG(home_goal) FROM match;


-- Exercise: Filtering using scalar subqueries
-- Objective: Use a subquery inside WHERE to filter match rows dynamically.
--
-- Instructions:
--   1. Calculate the average number of goals scored (home + away combined)
--      per match across the entire dataset. This is your scalar subquery.
--   2. Select the match id, country_id, season, home_goal, and away_goal
--      from match.
--   3. Filter to only matches where the total goals scored in that match
--      (home_goal + away_goal) are greater than the average total goals.

SELECT
    id, country_id, season, home_goal, away_goal
FROM match
WHERE (home_goal + away_goal) > (
    SELECT AVG(home_goal + away_goal) FROM match
);

-- Exercise: Filtering using a subquery with a list
-- Objective: Use IN with a subquery that returns multiple rows to filter matches.
--
-- Instructions:
--   1. The hometeam_id column in match links to team.team_api_id (not team.id).
--   2. Write a subquery that returns the team_api_id of every team whose
--      team_long_name contains the word 'United'.
--   3. Select the id, hometeam_id, and season from match.
--   4. Filter to only matches where the home team is one of those 'United' clubs.

SELECT
    id, hometeam_id, season
FROM match
WHERE hometeam_id IN (
    SELECT team_api_id FROM team WHERE team_long_name LIKE '%United%' 
);

-- Exercise: Filtering with more complex subquery conditions
-- Objective: Combine a scalar subquery and a list subquery in one WHERE clause.
--
-- Instructions:
--   1. Select id, season, home_goal, and away_goal from match.
--   2. Filter to matches that meet BOTH conditions:
--      a. The home team is a 'United' club (team_long_name LIKE '%United%').
--         Use IN with a subquery on team.team_api_id — same as Lesson 3.
--      b. The total goals scored (home_goal + away_goal) are greater than
--         the average total goals across ALL matches.
--         Use a scalar subquery — same as Lesson 2.
--   3. Use AND to combine both conditions.

SELECT
    id, season, home_goal, away_goal
FROM match
WHERE hometeam_id IN (
    SELECT team_api_id FROM team WHERE team_long_name LIKE '%United%'
)
AND (home_goal + away_goal) > (
  SELECT AVG(home_goal + away_goal) FROM match
);

-- A subquery in FROM acts as a temporary table.
-- Every FROM subquery MUST have an alias.
--
-- Example: average goals per season (inner), then filter by that average (outer)

SELECT season, avg_goals
FROM (
    SELECT season, AVG(home_goal + away_goal) AS avg_goals
    FROM match
    GROUP BY season
) AS season_avgs
WHERE avg_goals > 2.75;

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

-- Exercise: Add a subquery to the SELECT clause
-- Objective: Append a global average as a calculated column to each row.
--
-- Instructions:
--   1. Select country_id and AVG(home_goal + away_goal) AS avg_goals
--      from match, grouped by country_id.
--   2. Add a second column in SELECT: the overall average goals per match
--      across the ENTIRE match table (not per country) — use a subquery.
--      Alias it AS overall_avg.
--   3. No WHERE or HAVING needed.

SELECT
    country_id,
    AVG(home_goal + away_goal) AS avg_goals,
    (SELECT AVG(home_goal + away_goal) FROM match) AS overall_avg
FROM match
GROUP BY country_id;

-- Exercise: Subqueries in Select for Calculations
-- Objective: Use a SELECT subquery to compute a difference column.
--
-- Instructions:
--   1. Select country_id and AVG(home_goal + away_goal) AS avg_goals from match,
--      grouped by country_id.
--   2. Add a third column: the difference between each country's avg_goals
--      and the overall average across all matches.
--      Calculate it as:
--        AVG(home_goal + away_goal) - (SELECT AVG(home_goal + away_goal) FROM match)
--      Alias it AS diff.
--   3. Order by diff DESC so the highest-scoring leagues appear first.

SELECT
    country_id,
    AVG(home_goal + away_goal) AS avg_goals,
AVG(home_goal + away_goal) - (SELECT AVG(home_goal + away_goal) FROM match) AS diff
FROM match
GROUP BY country_id
ORDER BY diff DESC;

-- All three placements in one query:
SELECT
    c.name,
	
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
WHERE c FROM match
)
ORDER BY avg_goals DESC;
	
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

-- Exercise: Add a subquery in FROM
-- Objective: Use a FROM subquery to get per-season stats, then filter on them.
--
-- Instructions:
--   1. Write a subquery in FROM that calculates per season:
--        - COUNT(*) AS total_matches
--        - SUM(home_goal) AS total_home_goals
--        - SUM(away_goal) AS total_away_goals
--      from match, grouped by season. Alias it AS season_stats.
--   2. Select season_stats.season, season_stats.total_matches,
--      season_stats.total_home_goals, season_stats.total_away_goals.
--   3. Filter to seasons where total_home_goals > total_away_goals.
--   4. Order by season ASC.

SELECT
    season_stats.season, total_matches, total_home_goals, total_away_goals
FROM (
    SELECT season, COUNT(*) AS total_matches, 
    SUM(home_goal) AS total_home_goals, 
    SUM(away_goal) AS total_away_goals
    FROM match
    GROUP BY season
) AS season_stats
WHERE total_home_goals > total_away_goals
ORDER BY season ASC;

-- Exercise: Add a subquery in SELECT
-- Objective: Append a global count as a SELECT subquery alongside grouped results.
--
-- Instructions:
--   1. Select season and COUNT(*) AS total_matches from match, grouped by season.
--   2. Add a second column using a SELECT subquery: the total number of matches
--      across ALL seasons combined. Alias it AS overall_total.
--   3. No WHERE needed.
--   4. Order by season ASC.

SELECT
    season,
    COUNT(*) AS total_matches,
    (SELECT COUNT(*) FROM match) AS overall_total
FROM match
GROUP BY season
ORDER BY season ASC;


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




   




