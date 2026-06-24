-- Exercise: Pivoting with ranking
-- Objective: Rank countries by gold medals per year, then pivot so years become columns.
--
-- Instructions:
--   1. Inside the $$ block, write a query that:
--        a. Uses DENSE_RANK() OVER (PARTITION BY year ORDER BY COUNT(*) DESC)
--           to rank countries by gold medals within each year.
--        b. Filters to years 2004, 2008, 2012 and medal = 'Gold'.
--        c. Groups by year and country.
--        d. Returns three columns in this order:
--             rank (DENSE_RANK result cast to TEXT), year (cast to TEXT), country (TEXT)
--        e. Orders by rank ASC, year ASC.
--   2. In the outer AS ct(...) declaration, name the columns:
--        rank TEXT, "2004" TEXT, "2008" TEXT, "2012" TEXT
--
-- Expected shape: 3 rows (ranks 1–3), 4 columns (rank + one per year).
-- Each cell shows the country that ranked 1st/2nd/3rd in gold medals that year.

SELECT *
FROM CROSSTAB($$
SELECT
  DENSE_RANK() OVER(PARTITION BY year ORDER BY COUNT(*) DESC) ::TEXT as rank,
  year::TEXT,
  country
  FROM summer_medals
   WHERE year IN(2004, 2008, 2012) AND medal = 'Gold'
   GROUP BY year,country
   ORDER BY rank, year
$$) AS ct (RANK TEXT, "2004" TEXT, "2008" TEXT, "2012" TEXT
);
