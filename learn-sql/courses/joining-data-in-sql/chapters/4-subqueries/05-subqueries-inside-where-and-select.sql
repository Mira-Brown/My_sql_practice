-- Lesson: Subqueries inside WHERE and SELECT (Video)
-- WHERE subquery → filters rows using a value/set from another table
-- SELECT subquery → adds a computed scalar column (must return exactly one value)

-- WHERE: countries with above-average GDP
SELECT name
FROM countries
WHERE code IN (
    SELECT code FROM economies
    WHERE gdp_percapita > (SELECT AVG(gdp_percapita) FROM economies)
);

-- SELECT: each country with total language count as a column
SELECT name,
       (SELECT COUNT(*) FROM languages) AS total_languages
FROM countries
LIMIT 4;
-- Result: every row shows 955 (same scalar repeated)
