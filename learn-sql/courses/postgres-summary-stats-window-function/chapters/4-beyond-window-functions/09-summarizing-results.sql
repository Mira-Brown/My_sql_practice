-- Exercise: Summarizing results
-- Objective: Use STRING_AGG to list all gold-medal athletes per country in one string.
--
-- Instructions:
--   1. SELECT country and a STRING_AGG column aliased as athletes.
--   2. STRING_AGG should concatenate DISTINCT athlete names, separated by ', ',
--      ordered alphabetically (ORDER BY athlete ASC inside STRING_AGG).
--   3. FROM summer_medals
--   4. Filter to: medal = 'Gold', year = 2012, country IN ('CHN', 'RUS', 'USA').
--   5. GROUP BY country
--   6. ORDER BY country ASC.

-- TODO: write your query here
SELECT country, 
       STRING_AGG(DISTINCT athlete, ',' ORDER BY athlete ASC) AS athletes
FROM summer_medals
WHERE medal = 'Gold'
  AND year = 2012
  AND country IN ('CHN', 'RUS', 'USA')
GROUP BY country
ORDER BY country ASC;          