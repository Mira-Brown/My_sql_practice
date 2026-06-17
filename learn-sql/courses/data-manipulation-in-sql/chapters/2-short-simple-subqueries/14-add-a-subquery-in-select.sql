-- Exercise: Add a subquery in SELECT
-- Objective: Append a global count as a SELECT subquery alongside grouped results.
--
-- Instructions:
--   1. Select season and COUNT(*) AS total_matches from match, grouped by season.
--   2. Add a second column using a SELECT subquery: the total number of matches
--      across ALL seasons combined. Alias it AS overall_total.
--   3. No WHERE needed.
--   4. Order by season ASC.

SELECT
    season,
    COUNT(*) AS total_matches,
    (SELECT COUNT(*) FROM match) AS overall_total
FROM match
GROUP BY season
ORDER BY season ASC;
