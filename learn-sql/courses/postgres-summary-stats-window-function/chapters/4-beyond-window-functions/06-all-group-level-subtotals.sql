-- Exercise: All group-level subtotals
-- Objective: Use CUBE to generate subtotals across every combination of country and medal.
--
-- Instructions:
--   1. SELECT country, medal, COUNT(*) AS awards
--   2. FROM summer_medals
--   3. Filter to year = 2008 only.
--   4. GROUP BY CUBE(country, medal)
--   5. ORDER BY country ASC, medal ASC.
--
-- You should get detail rows + per-country subtotals + per-medal subtotals + grand total.

-- TODO: write your query here
SELECT country,
       medal,
       COUNT(*) AS awards
FROM summer_medals       
WHERE year = 2008
GROUP BY CUBE(Country, medal)
ORDER BY country ASC, medal ASC;       