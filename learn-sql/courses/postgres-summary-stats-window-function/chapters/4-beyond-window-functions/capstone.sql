-- ============================================================
-- CAPSTONE — Chapter 4: Beyond Window Functions
-- ============================================================
-- Engine: PostgreSQL — run with psql -d postgres_summary_stats
--
-- Scenario: End-of-Games medal summary for the 2008 Beijing Olympics.
-- You are producing two reports for a sports analytics team.
--
-- ── REPORT 1: Pivot ──────────────────────────────────────────
-- Show the top-ranked country for each medal type (Gold, Silver, Bronze)
-- in 2008, pivoted so medal types become columns.
--
-- Requirements:
--   a. Inside the $$ block:
--      - DENSE_RANK() OVER (PARTITION BY medal ORDER BY COUNT(*) DESC) as rank
--      - Filter to year = 2008
--      - GROUP BY medal, country
--      - ORDER BY rank, medal
--      - Return columns: rank::TEXT, medal, country
--   b. Outer ct declaration: rank TEXT, "Bronze" TEXT, "Gold" TEXT, "Silver" TEXT
--   c. Wrap in a subquery and filter to rank = '1' to show only top country per medal.
--
-- Expected shape: 1 row, 4 columns.
-- e.g.  rank | Bronze | Gold | Silver
--       1    | USA    | USA  | USA

-- ── REPORT 2: ROLLUP with COALESCE and STRING_AGG ────────────
-- For countries CHN, GBR, USA in 2012:
--   a. Use ROLLUP(country, medal) to get detail rows + per-country subtotals + grand total.
--   b. Wrap country with COALESCE(..., 'All countries')
--      and medal with COALESCE(..., 'All medals').
--   c. Add a STRING_AGG(DISTINCT athlete, ', ' ORDER BY athlete) AS top_athletes column.
--   d. GROUP BY ROLLUP(country, medal)
--   e. ORDER BY country, medal.
--
-- Expected shape: subtotal rows show 'All medals' / 'All countries',
-- and each detail row lists all gold-winning athletes in that country+medal cell.
-- Filter to medal = 'Gold' so STRING_AGG stays readable.

-- ── Write Report 1 below ─────────────────────────────────────
SELECT * FROM (
  SELECT * FROM CROSSTAB($$
    SELECT
      DENSE_RANK() OVER (PARTITION BY medal ORDER BY COUNT(*) DESC)::TEXT AS rank,
      medal,
      country
    FROM summer_medals
    WHERE year = 2008
    GROUP BY medal, country
    ORDER BY rank, medal
  $$) AS ct (rank TEXT, "Bronze" TEXT, "Gold" TEXT, "Silver" TEXT)
) sub
WHERE rank = '1';

-- ── Write Report 2 below ─────────────────────────────────────
SELECT
  COALESCE(country, 'All countries') AS country,
  COALESCE(medal, 'All medals') AS medal,
  COUNT(*) AS medals,
  STRING_AGG(DISTINCT athlete, ', ' ORDER BY athlete) AS top_athletes
FROM summer_medals
WHERE year = 2012
  AND country IN ('CHN', 'GBR', 'USA')
  AND medal = 'Gold'
GROUP BY ROLLUP(country, medal)
ORDER BY country, medal;