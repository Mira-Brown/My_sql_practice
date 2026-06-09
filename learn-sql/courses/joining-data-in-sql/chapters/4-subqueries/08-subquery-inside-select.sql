-- Exercise: Subquery inside SELECT
-- Objective: For each continent, count how many countries are in the
--            countries table and show it alongside the continent name.
-- Instructions:
--   1. SELECT continent from the countries table.
--   2. Add a second column using a subquery in SELECT that counts the number
--      of countries in the countries table that share the same continent
--      as the outer query row. Alias it as countries_num.
--   3. ORDER BY countries_num DESC.

-- Hint: The subquery needs to reference the outer query's continent value.
--       Use WHERE c2.continent = c1.continent inside the subquery,
--       where c1 is the alias for the outer table and c2 for the inner.

-- TODO: Write your query here


SELECT c1.continent,
       (SELECT COUNT(*)
        FROM countries c2
        WHERE c2.continent = c1.continent) AS countries_num
FROM countries c1
ORDER BY countries_num DESC;
