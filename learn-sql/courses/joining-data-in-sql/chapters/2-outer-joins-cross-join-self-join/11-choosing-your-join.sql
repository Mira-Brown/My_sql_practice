-- Exercise: Choosing your join
-- Objective: Pick the correct join type for each scenario below.
--            Write the query for scenario (c) only.
--
-- Scenario (a): You want only countries that have an economy record.
--               → Which join? INNER JOIN
--
-- Scenario (b): You want ALL countries, with economy data where it exists.
--               → Which join? LEFT JOIN
--
-- Scenario (c): Write it — return c.name AS country, c.continent,
--               e.gdp_percapita from countries (left) and economies (right),
--               keeping ALL countries even those with no economy record,
--               filtered to year 2010, ordered by gdp_percapita DESC.
--               Use whichever join type fits scenario (b).

-- TODO: write the query for scenario (c) here
SELECT
    c.name          AS country,
    c.continent,
    e.gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
    ON c.code = e.code
    AND e.year = 2010
ORDER BY e.gdp_percapita DESC;

-- Mini challange
SELECT
    c.continent,
    ROUND(AVG(p.life_expectancy), 2)   AS avg_life_expectancy
FROM countries AS c
LEFT JOIN populations AS p
    ON c.code = p.country_code
WHERE p.year = 2015
GROUP BY c.continent
HAVING AVG(p.life_expectancy) > 70
ORDER BY avg_life_expectancy DESC;