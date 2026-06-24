-- Lesson 1: Pivoting
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — run with psql -d postgres_summary_stats

-- CONCEPT: crosstab() pivots row values into columns.
-- Requires CREATE EXTENSION tablefunc (already loaded in this DB).

-- Mini-example: gold medals for CHN, RUS, USA in 2004 and 2008, unpivoted first
SELECT country, year, COUNT(*) AS medals
FROM summer_medals
WHERE medal = 'Gold'
  AND country IN ('CHN', 'RUS', 'USA')
  AND year IN (2004, 2008)
GROUP BY country, year
ORDER BY country, year;

-- Same data pivoted — years become columns
SELECT *
FROM CROSSTAB($$
  SELECT country, year::TEXT, COUNT(*)::INT AS medals
  FROM summer_medals
  WHERE medal = 'Gold'
    AND country IN ('CHN', 'RUS', 'USA')
    AND year IN (2004, 2008)
  GROUP BY country, year
  ORDER BY country, year
$$) AS ct (country TEXT, "2004" INT, "2008" INT);
