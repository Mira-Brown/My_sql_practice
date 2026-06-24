-- Exercise: A basic pivot
-- Objective: Use crosstab() to pivot gold medal counts by country and Olympic year.
--
-- Instructions:
--   1. Write a CTE called `country_medals` that counts Gold medals
--      per country per year, for countries: 'CHN', 'RUS', 'USA'.
--      Columns: country, year, medals (COUNT(*)).
--   2. Pass the CTE to crosstab() so that:
--        - The inner query SELECTs country, year::TEXT, medals FROM country_medals
--          ORDER BY country, year.
--        - The outer column list declares: country TEXT, "2008" INT, "2012" INT.
--      (Filter to years 2008 and 2012 inside the CTE.)

-- TODO: write your CTE
SELECT *
FROM CROSSTAB($$
  SELECT country, year::TEXT, COUNT(*)::INT AS medals
  FROM summer_medals
  WHERE medal = 'Gold'
    AND country IN ('CHN', 'RUS', 'USA')
    AND year IN (2008, 2012)
  GROUP BY country, year
  ORDER BY country, year
$$) AS ct (country TEXT, "2008" INT, "2012" INT);
