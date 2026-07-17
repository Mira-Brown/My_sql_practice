-- ============================================================
-- CAPSTONE — Chapter 3: Aggregate Window Functions and Frames
-- ============================================================
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)
--
-- Scenario: You're producing a gold-medal trend report for three
-- powerhouse nations: USA, CHN, GBR. The report needs four things
-- in one query, built via CTEs:
--
-- CTE 1 (yearly): Gold medals per country per year.
--   Columns: country, year, medals
--   Filter: country IN ('USA','CHN','GBR'), medal = 'Gold'
--
-- CTE 2 (with_windows): Adds four window columns to yearly,
--   all partitioned by country and ordered by year:
--
--   a. running_total  — cumulative SUM (unbounded preceding → current)
--   b. moving_total   — 3-year SUM    (2 preceding → current)
--   c. moving_avg     — 3-year AVG    (2 preceding → current), rounded to 2 dp
--   d. running_max    — cumulative MAX (unbounded preceding → current)
--
-- Final SELECT: return all columns from with_windows.
--   Order by country, year.
--
-- Requirements:
--   - Use ROWS BETWEEN (not RANGE) for all frames.
--   - Both CTEs must be named exactly as above.
--   - One query, no subqueries in FROM — CTEs only.

-- Write your query below:
WITH yearly AS (
  SELECT country, year, COUNT(*) AS medals
  FROM summer_medals
  WHERE country IN ('USA','CHN','GBR')
        AND medal = 'Gold'
  GROUP BY country, year
),
with_windows AS (
  SELECT
    *,
    SUM(medals) OVER (PARTITION BY country ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  AS running_total,
    SUM(medals) OVER (PARTITION BY country ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)  AS moving_total,
    ROUND(AVG(medals) OVER (PARTITION BY country ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg,
    MAX(medals) OVER (PARTITION BY country ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  AS running_max
  FROM yearly
)
SELECT * FROM with_windows
ORDER BY country, year;

