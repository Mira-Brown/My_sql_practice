-- Lesson 7: A survey of useful functions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — run with psql -d postgres_summary_stats

-- COALESCE: replace NULLs in ROLLUP output with readable labels
SELECT
  COALESCE(country, 'All countries') AS country,
  COALESCE(medal, 'All medals') AS medal,
  COUNT(*) AS awards
FROM summer_medals
WHERE year = 2008
  AND country IN ('CHN', 'USA')
GROUP BY ROLLUP(country, medal)
ORDER BY country, medal;

-- STRING_AGG: concatenate gold medal countries into one string per year
SELECT year,
       STRING_AGG(country, ', ' ORDER BY country) AS countries
FROM summer_medals
WHERE medal = 'Gold'
  AND year IN (2004, 2008)
  AND country IN ('CHN', 'RUS', 'USA')
GROUP BY year
ORDER BY year;
