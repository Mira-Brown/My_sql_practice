-- ============================================================
-- CAPSTONE — Chapter 2: Summarizing and Aggregating Numeric Data
-- ============================================================
-- Engine: PostgreSQL — psql -d eda
--
-- Scenario: Produce a "sector profitability" briefing for Fortune-500 sectors.
--
-- Requirements:
--   1. Build a TEMP TABLE sector_stats holding, per sector:
--        - company_count
--        - avg profit margin  = sum(profits) / sum(revenues)  (keep decimals)
--        - median employees   = percentile_disc(0.5) WITHIN GROUP (ORDER BY employees)
--   2. From sector_stats, return only sectors with 5+ companies.
--   3. Order by profit margin descending.
--   4. Separately, report the correlation between revenues and profits overall.
-- ============================================================

-- Reference query:
CREATE TEMP TABLE sector_stats AS
SELECT sector,
       count(*)                                AS company_count,
       sum(profits)::numeric / sum(revenues)   AS margin,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY employees) AS median_employees
FROM fortune500
GROUP BY sector;

SELECT sector, company_count, margin, median_employees
FROM sector_stats
WHERE company_count >= 5
ORDER BY margin DESC;

SELECT corr(revenues, profits) AS revenues_profits_corr
FROM fortune500;
