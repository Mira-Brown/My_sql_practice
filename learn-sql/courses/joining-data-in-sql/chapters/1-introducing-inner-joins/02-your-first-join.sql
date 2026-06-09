-- Exercise: Your first join
-- Objective: Use INNER JOIN to combine the countries and economies tables.
-- Instructions:
--   1. SELECT the country name (from countries) and GDP per capita (from economies).
--   2. INNER JOIN economies onto countries using: countries.code = economies.code.
--   3. Filter to only rows where year = 2015.
--   4. ORDER BY gdp_percapita descending so the wealthiest countries appear first.
--   5. LIMIT to 10 rows.


SELECT countries.name, economies.gdp_percapita
FROM countries
INNER JOIN economies ON countries.code = economies.code
WHERE year = 2015
ORDER BY gdp_percapita DESC
LIMIT 10;
