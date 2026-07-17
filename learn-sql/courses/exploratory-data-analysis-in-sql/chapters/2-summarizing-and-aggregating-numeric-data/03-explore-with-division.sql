-- Lesson 3: Explore with division
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Ratios expose patterns raw totals hide. Group first, then divide the
-- aggregated numerator by the aggregated denominator.
--
-- Example — profit margin (profits / revenues) by sector:
SELECT sector,
       sum(profits)::numeric / sum(revenues) AS margin
FROM fortune500
GROUP BY sector
ORDER BY margin DESC;

-- Exercise: Explore with division
-- Objective: For each sector, compute average revenue per employee.
-- Instructions:
--   1. Group fortune500 by sector.
--   2. Divide sum(revenues) by sum(employees), cast to keep decimals.
--   3. Order by the ratio descending.

-- TODO: write your query below
SELECT sector,
       sum(revenues)::numeric / sum(employees) AS rev_per_employee
FROM fortune500
GROUP BY sector
ORDER BY rev_per_employee DESC;
