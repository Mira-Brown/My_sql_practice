-- Lesson 1: Fetching
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — table summer_medals (Summer Olympic medals). DB built via ../../database/setup.sh
--
-- Fetching functions pull a value from another row in the same result set — no self-join needed.
--
--   LAG(col, n)    — value from n rows BEFORE the current row (default n=1)
--   LEAD(col, n)   — value from n rows AFTER  the current row (default n=1)
--   FIRST_VALUE(col) — value from the first row of the window / partition
--   LAST_VALUE(col)  — value from the last row  (needs ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
--
-- Example: USA gold medals per year, with the previous year's count for comparison.

SELECT
    year,
    COUNT(*) AS medals,
    LAG(COUNT(*)) OVER (ORDER BY year) AS prev_year_medals
FROM summer_medals
WHERE country = 'USA' AND medal = 'Gold'
GROUP BY year
ORDER BY year;

-- Result snippet:
--  year | medals | prev_year_medals
-- ------+--------+------------------
--  1896 |     11 |            (null)   ← no prior row
--  1900 |     27 |               11
--  1904 |    146 |               27
--  1908 |     34 |              146
