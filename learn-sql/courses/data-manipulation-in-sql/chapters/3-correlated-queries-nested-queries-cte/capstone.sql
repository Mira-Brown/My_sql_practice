-- ============================================================
-- CAPSTONE — Chapter 3: Correlated Queries, Nested Queries, and CTEs
-- ============================================================
-- Scenario: You are a football analyst producing an end-of-season
-- report on team home performance. The report needs three things:
--
--   PART A — Dominant home performances
--   Find every match where the home team scored MORE than the average
--   home goals for that specific season. Use a CORRELATED subquery.
--   Return: id, season, hometeam_id, home_goal, away_goal
--
--   PART B — Season rating
--   Classify each season as 'High Scoring' or 'Low Scoring' based on
--   whether its average total goals (home + away) exceeded the average
--   of all season averages. Use a NESTED subquery.
--   Return: season, avg_total_goals, rating
--
--   PART C — Top home teams with context
--   For each team, show their name (from the team table), average home
--   goals, and whether that average beats the overall average home goals
--   across all matches. Use CTEs for home_stats and overall_avg, then
--   join and label in the main query.
--   Return: team_long_name, avg_home_goals, vs_overall
--           (vs_overall = 'Above average' or 'Below average')
--   ORDER BY avg_home_goals DESC
-- ============================================================

-- PART A: Dominant home performances (correlated subquery)
SELECT id, season, hometeam_id, home_goal, away_goal
FROM match AS m
WHERE home_goal > (
    SELECT AVG(home_goal)
    FROM match
    WHERE season = m.season
);

-- PART B: Season rating (nested subquery)
SELECT 
    season,
    AVG(home_goal + away_goal) AS avg_total_goals,
    CASE WHEN AVG(home_goal + away_goal) > (
        SELECT AVG(avg_goals)
        FROM (SELECT AVG(home_goal + away_goal) AS avg_goals
            FROM match GROUP BY season
            ) AS season_avgs) THEN 'High Scoring'
        ELSE 'Low Scoring' END AS rating
FROM match
GROUP BY season;

-- PART C: Top home teams with context (CTEs)
WITH
home_stats AS (
    SELECT hometeam_id, AVG(home_goal) AS avg_home_goals
    FROM match
    GROUP BY hometeam_id
),
overall_avg AS (
    SELECT AVG(home_goal) AS avg_goals
    FROM match
)
SELECT 
    t.team_long_name,
    h.avg_home_goals,
    CASE 
        WHEN h.avg_home_goals > (SELECT avg_goals FROM overall_avg) 
        THEN 'Above average'
        ELSE 'Below average'
    END AS vs_overall
FROM home_stats AS h
JOIN team AS t ON h.hometeam_id = t.team_api_id
ORDER BY h.avg_home_goals DESC;
