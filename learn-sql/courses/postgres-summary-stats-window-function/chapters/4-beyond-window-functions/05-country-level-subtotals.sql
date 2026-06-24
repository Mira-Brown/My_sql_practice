-- Exercise: Country-level subtotals
-- Objective: Use ROLLUP to get gold medal counts with per-country subtotals.
--
-- Instructions:
--   1. SELECT country, medal, COUNT(*) AS awards
--   2. FROM summer_medals
--   3. Filter to year = 2008 only.
--   4. GROUP BY ROLLUP(country, medal) — this gives detail rows + per-country subtotals + grand total.
--   5. ORDER BY country ASC, medal ASC.

-- TODO: write your query here
SELECT country,
       medal,
       COUNT(*) AS awards
FROM summer_medals
WHERE year = 2008
GROUP BY ROLLUP(country, medal)
ORDER BY country ASC, medal ASC;       