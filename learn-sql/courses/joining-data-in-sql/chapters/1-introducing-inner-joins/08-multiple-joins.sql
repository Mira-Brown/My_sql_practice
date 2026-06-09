-- Lesson 8: Multiple joins
-- See: ../../assets/multiple_join_diagram.png

-- Chain multiple INNER JOINs to pull from 3+ tables in one query.
-- Each JOIN needs its own ON (or USING) clause.

-- Example: country name + GDP per capita + currency, for 2015.
-- countries --> economies (via code)
-- countries --> currencies (via code)

SELECT c.name AS country,
       e.gdp_percapita,
       cu.basic_unit AS currency
FROM countries AS c
INNER JOIN economies AS e USING (code)
INNER JOIN currencies AS cu USING (code)
WHERE e.year = 2015
ORDER BY e.gdp_percapita DESC
LIMIT 10;
