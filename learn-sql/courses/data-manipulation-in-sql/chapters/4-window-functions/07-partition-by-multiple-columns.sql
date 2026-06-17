-- Lesson 7: PARTITION BY multiple columns
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- You can partition by more than one column — the window resets for each
-- unique COMBINATION of the partition columns.
--
-- Worked example: average home goals per season AND per country
--
--   SELECT m.id, m.season, c.name AS country, m.home_goal,
--          AVG(m.home_goal) OVER(PARTITION BY m.season, c.name) AS avg_home
--   FROM match AS m
--   JOIN country AS c ON m.country_id = c.id
--   ORDER BY c.name, m.season
--   LIMIT 8;
--
-- Results:
--   Belgium | 2011/2012 | avg_home = 1.754  ← Belgium 2011/2012 average
--   Belgium | 2011/2012 | avg_home = 1.754
--   ...
--   Belgium | 2012/2013 | avg_home = 1.XX   ← resets: new season
--   England | 2011/2012 | avg_home = 1.XX   ← resets: new country
--
-- PARTITION BY m.season alone → 4 windows (one per season)
-- PARTITION BY m.season, c.name → 44 windows (4 seasons × 11 countries)
--
-- Exercise: home and away goal averages per season AND country
-- Objective: Partition by two columns to get averages for each
--            season-country combination on every match row.
--
-- Instructions:
--   1. Select m.id, m.season, c.name aliased as country,
--      m.home_goal, m.away_goal from match AS m.
--   2. JOIN country AS c ON m.country_id = c.id.
--   3. Add AVG(m.home_goal) partitioned by season AND country name
--      — alias avg_home.
--   4. Add AVG(m.away_goal) partitioned by season AND country name
--      — alias avg_away.
--   5. Order by country, then season.

SELECT
    m.id,
    m.season,
    c.name AS country,
    m.home_goal,
    m.away_goal,
    AVG(home_goal) OVER(PARTITION BY season, c.name) AS avg_home,
    AVG(away_goal) OVER(PARTITION BY season, c.name) AS avg_away
FROM match AS m
JOIN country AS c ON  m.country_id = c.id
ORDER BY country, season;
