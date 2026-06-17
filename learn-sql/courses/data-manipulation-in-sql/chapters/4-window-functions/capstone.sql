-- ============================================================
-- CAPSTONE — Chapter 4: Window Functions
-- ============================================================
-- Dataset: data-manipulation-in-sql (European Soccer)
-- DB: ../../database/data-manipulation-in-sql.db
--
-- Scenario:
--   A league analyst wants a matchday-by-matchday report for the
--   England Premier League in the 2012/2013 season showing:
--     • Both team names and goals for each match
--     • A labelled match outcome (home win / away win / draw)
--     • Each match ranked by home goals within that season/country
--     • A running cumulative total of home goals as the season progresses
--
-- Requirements:
--   1. Define a home CTE that selects:
--        m.id, m.season, m.stage, c.name AS country,
--        t.team_long_name AS home_team, m.home_goal, m.away_goal
--      joining match → team (on hometeam_id) and match → country.
--
--   2. Define an away CTE that selects:
--        m.id, t.team_long_name AS away_team
--      joining match → team (on awayteam_id).
--
--   3. In the main SELECT from home AS h JOIN away AS a ON h.id = a.id:
--      a. Select: h.season, h.country, h.stage, h.home_team, a.away_team,
--                 h.home_goal, h.away_goal.
--      b. Add a CASE statement labelling each match:
--             'home win' / 'away win' / 'draw' — alias outcome.
--      c. Add RANK() partitioned by season and country,
--             ordered by home_goal DESC — alias home_rank.
--      d. Add a running total of home_goal partitioned by season and country,
--             ordered by stage, frame UNBOUNDED PRECEDING to CURRENT ROW
--             — alias running_home_goals.
--
--   4. Filter to country = 'England' AND season = '2012/2013'.
--   5. ORDER BY h.stage, home_rank.
--
-- Expected first rows:
-- season    | country | stage | home_team | away_team    | home_goal | away_goal | outcome  | home_rank | running_home_goals
-- 2012/2013 | England |   1   | Fulham    | Norwich City |     5     |     0     | home win |     5     |        5
-- 2012/2013 | England |   1   | Man City  | Southampton  |     3     |     2     | home win |    29     |        8
-- ============================================================

-- Write your query below:

WITH home AS (
  SELECT 
    m.id, 
    m.season, 
    m.stage, 
    c.name AS country,
    t.team_long_name AS home_team, 
    m.home_goal, 
    m.away_goal
  FROM match AS m
  LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id
  LEFT JOIN country AS c ON m.country_id = c.id
),
away AS (
  SELECT 
    m.id, 
    t.team_long_name AS away_team
  FROM match AS m
  LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id
)
SELECT
  h.season,
  h.country,
  h.stage,
  h.home_team,
  a.away_team,
  h.home_goal,
  h.away_goal,
  CASE WHEN h.home_goal > h.away_goal THEN 'home win'
       WHEN h.home_goal < h.away_goal THEN 'away win'
       ELSE 'draw' END AS outcome,
  RANK() OVER(PARTITION BY h.season, h.country 
              ORDER BY h.home_goal DESC) AS home_rank,
  SUM(h.home_goal) OVER(PARTITION BY h.season, h.country 
                         ORDER BY h.stage 
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_home_goals
FROM home AS h
JOIN away AS a ON h.id = a.id
WHERE h.country = 'England' AND h.season = '2012/2013'
ORDER BY h.stage, home_rank;