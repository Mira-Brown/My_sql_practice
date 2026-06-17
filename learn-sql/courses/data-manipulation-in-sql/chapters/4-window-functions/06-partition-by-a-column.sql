-- Lesson 6: PARTITION BY a column
-- Type: Exercise </> (100 XP)
-- Dataset: data-manipulation-in-sql (European Soccer) — DB at ../../database/data-manipulation-in-sql.db
--
-- Exercise: Per-season goal averages with PARTITION BY
-- Objective: Use PARTITION BY inside OVER() to calculate separate home and
--            away goal averages for each season, alongside every match row.
--
-- Instructions:
--   1. Select id, season, home_goal, and away_goal from match.
--   2. Add AVG(home_goal) partitioned by season — alias it avg_home.
--   3. Add AVG(away_goal) partitioned by season — alias it avg_away.
--   4. Order results by season.

SELECT
    id,
    season,
    home_goal,
    away_goal,
    AVG(home_goal) OVER() AS overall_avg,
    AVG(home_goal) OVER(PARTITION BY season) AS season_avg,
    RANK() OVER(PARTITION BY season ORDER BY home_goal DESC) AS season_rank 
FROM match
ORDER BY season, season_rank;
