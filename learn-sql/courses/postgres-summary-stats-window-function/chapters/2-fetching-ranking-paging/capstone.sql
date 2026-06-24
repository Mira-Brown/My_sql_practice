-- ============================================================
-- CAPSTONE — Chapter 2: Fetching, Ranking, and Paging
-- ============================================================
-- Engine: PostgreSQL — table summer_medals. DB: postgres_summary_stats
--
-- Scenario: You're building a medal performance report for Swimming
-- across all Olympic years. The report must answer three questions
-- in a single query using CTEs:
--
-- 1. TREND — For each year, how many gold medals did Swimming produce,
--    and how does that compare to the previous year?
--    (Use LAG to add a prev_medals column.)
--
-- 2. RANKING — Among all countries that won Swimming gold medals
--    across all years, what is each country's overall rank by
--    total gold medals? (Use DENSE_RANK, no partition.)
--
-- 3. PAGING — Split those ranked countries into 3 equal tiers
--    and label them 'Top', 'Middle', 'Bottom'.
--    Return only the Top tier.
--
-- Requirements:
--   CTE 1 (yearly_medals): gold medals per year in Swimming.
--     Columns: year, medals, prev_medals (LAG of medals over year).
--
--   CTE 2 (country_medals): total gold medals per country in Swimming.
--     Columns: country, medals.
--
--   CTE 3 (country_ranks): adds DENSE_RANK() and NTILE(3) to country_medals.
--     Columns: country, medals, rank, third.
--
--   Final SELECT from country_ranks: country, medals, rank, third (as label).
--     Filter to top tier only. Order by rank.
--
-- Bonus: also return the yearly_medals trend as a second result set
-- by adding a second SELECT from yearly_medals at the end.

-- Write your queries below:
WITH yearly_medals AS (
  SELECT
    year,
    COUNT(*) AS medals,
    LAG(COUNT(*)) OVER (ORDER BY year) AS prev_medals
  FROM summer_medals
  WHERE sport = 'Aquatics'
    AND medal = 'Gold'
  GROUP BY year
),
country_medals AS (
  SELECT country, COUNT(*) AS medals
  FROM summer_medals
  WHERE sport = 'Aquatics'
    AND medal = 'Gold'
  GROUP BY country
),
country_ranks AS (
  SELECT
    country,
    medals,
    DENSE_RANK() OVER (ORDER BY medals DESC) AS rank,
    NTILE(3) OVER (ORDER BY medals DESC) AS third
  FROM country_medals
)
SELECT
  country,
  medals,
  rank,
  CASE third WHEN 1 THEN 'Top' WHEN 2 THEN 'Middle' WHEN 3 THEN 'Bottom' END AS third
FROM country_ranks
WHERE third = 1
ORDER BY rank;

