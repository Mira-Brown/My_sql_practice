-- ============================================================
-- CAPSTONE — Chapter 1: Introduction to Window Functions
-- ============================================================
-- Engine: PostgreSQL — psql -d postgres_summary_stats
--
-- Scenario: You are building an Olympic leaderboard report.
-- The athletics director wants to know, for each country:
--   - How many Gold medals has each athlete won in Athletics?
--   - What is their rank within their country (most golds = rank 1)?
--   - Only show the top 3 athletes per country.
--   - Number each country's entries 1, 2, 3 in the final output.
--
-- Requirements:
--   1. Count Gold medals per athlete per country in Athletics,
--      aliasing the count as gold_medals.
--   2. Assign ROW_NUMBER() partitioned by country, ordered by
--      gold_medals descending, aliased as row_n.
--   3. Wrap in a subquery aliased as ranked.
--   4. In the outer query, select country, athlete, gold_medals, row_n.
--   5. Filter to the top 3 athletes per country (row_n <= 3).
--   6. Filter to countries with at least one athlete earning 3+ gold medals
--      (to keep the output focused — use a HAVING clause in the inner query).
--   7. Order final results by country, row_n.
-- ============================================================

-- Write your query below:  
SELECT country, athlete, gold_medals, row_n
FROM (
    SELECT country,
           athlete,
           COUNT(*) AS gold_medals,
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS row_n
    FROM summer_medals
    WHERE medal = 'Gold'
      AND sport = 'Athletics'
    GROUP BY country, athlete
    HAVING COUNT(*) >= 3
) AS ranked
WHERE row_n <= 3
ORDER BY country, row_n;   


