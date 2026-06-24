-- Lesson 4: ROLLUP and CUBE
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — run with psql -d postgres_summary_stats

-- ROLLUP: detail rows + per-country subtotals + grand total
SELECT country, year, COUNT(*) AS medals
FROM summer_medals
WHERE medal = 'Gold'
  AND country IN ('CHN', 'USA')
  AND year IN (2008, 2012)
GROUP BY ROLLUP(country, year)
ORDER BY country, year;

-- CUBE: all possible grouping combinations
SELECT country, year, COUNT(*) AS medals
FROM summer_medals
WHERE medal = 'Gold'
  AND country IN ('CHN', 'USA')
  AND year IN (2008, 2012)
GROUP BY CUBE(country, year)
ORDER BY country, year;
