-- Lesson 1: Aggregate window functions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — table summer_medals (DB: postgres_summary_stats)

-- KEY IDEA: Any aggregate function (SUM, MAX, MIN, AVG, COUNT) can be used
-- as a window function by adding OVER(). Instead of collapsing rows into one
-- group total, it computes the value per row while keeping all rows visible.

-- WITHOUT window function — GROUP BY collapses to one row per country:
--   SELECT country, COUNT(*) AS medals
--   FROM summer_medals
--   WHERE medal = 'Gold'
--   GROUP BY country;

-- WITH window function — every row stays, running total grows alongside:
--
--   SELECT country, year,
--          COUNT(*) AS yearly_medals,
--          SUM(COUNT(*)) OVER (PARTITION BY country ORDER BY year) AS running_total
--   FROM summer_medals
--   WHERE medal = 'Gold'
--   GROUP BY country, year;
--
-- OVER() anatomy recap:
--   PARTITION BY country  → reset the total for each country
--   ORDER BY year         → accumulate chronologically (default frame = all preceding rows)
--   (no frame clause)     → Postgres uses RANGE UNBOUNDED PRECEDING by default when ORDER BY present

-- Run this to see USA's cumulative gold medals grow year by year:
SELECT country, year,
       COUNT(*) AS yearly_medals,
       SUM(COUNT(*)) OVER (PARTITION BY country ORDER BY year) AS running_total
FROM summer_medals
WHERE medal = 'Gold'
  AND country = 'USA'
GROUP BY country, year
ORDER BY year;
