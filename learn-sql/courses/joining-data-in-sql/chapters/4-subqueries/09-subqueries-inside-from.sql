-- Lesson: Subqueries inside FROM (Video)
-- A FROM subquery creates a temporary table that the outer query works on.
-- The subquery alias after ) is required.

-- Average GDP per capita by continent in 2015
SELECT continent, AVG(gdp_percapita) AS avg_gdp
FROM (
    SELECT c.continent, e.gdp_percapita
    FROM countries c
    JOIN economies e ON c.code = e.code
    WHERE e.year = 2015
) AS subq
GROUP BY continent
ORDER BY avg_gdp DESC;
-- Result: Europe leads, Africa lowest
