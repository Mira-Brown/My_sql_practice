-- Capstone: Chapter 2 — Outer Joins, Cross Joins and Self Joins
--
-- You are a data analyst reporting on global development patterns.
-- Answer the three questions below using the join types from this chapter.
-- Write each as a separate, clearly labelled query.
--
-- ─────────────────────────────────────────────────────────────
-- Q1 — LEFT JOIN
-- Which countries have NO currency on record?
-- Return: c.name AS country, c.continent
-- FROM countries LEFT JOIN currencies
-- Show only rows where currency is missing (cu.code IS NULL).
-- Order by continent, then country.
-- ─────────────────────────────────────────────────────────────

-- Q1:
SELECT
    c.name          AS country,
    c.continent
FROM countries AS c
LEFT JOIN currencies AS cu
    ON c.code = cu.code
WHERE cu.code IS NULL
ORDER BY c.continent, c.name;

-- ─────────────────────────────────────────────────────────────
-- Q2 — Self join
-- Which countries saw their population MORE THAN DOUBLE
-- between 2010 and 2015?
-- Return: p1.country_code, p1.size AS pop_2010, p2.size AS pop_2015
-- FROM populations self-joined on country_code
-- Filter: p2.size > p1.size * 2
-- Order by country_code.
-- ─────────────────────────────────────────────────────────────

-- Q2:
SELECT
    p1.country_code,
    p1.size         AS pop_2010,
    p2.size         AS pop_2015
FROM populations AS p1
INNER JOIN populations AS p2
    ON p1.country_code = p2.country_code
    AND p1.year = 2010
    AND p2.year = 2015
WHERE p2.size > p1.size * 2
ORDER BY p1.country_code;

-- ─────────────────────────────────────────────────────────────
-- Q3 — FULL JOIN
-- Produce a combined list of all prime ministers and all presidents,
-- matched to their country where possible.
-- Return: c.name AS country, pm.prime_minister, p.president
-- FROM countries FULL JOIN prime_ministers FULL JOIN presidents
-- Order by country.
-- ─────────────────────────────────────────────────────────────

-- Q3:
SELECT
    c.name          AS country,
    pm.prime_minister,
    p.president
FROM countries AS c
FULL JOIN prime_ministers AS pm
    ON c.name = pm.country
FULL JOIN presidents AS p
    ON c.name = p.country
ORDER BY country;