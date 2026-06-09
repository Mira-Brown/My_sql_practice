-- Lesson: LEFT and RIGHT JOINs
-- See: ../../assets/left_join2.png
-- See: ../../assets/right_join2.png

-- INNER JOIN recap: only rows with a match in BOTH tables survive.
-- LEFT JOIN: ALL rows from the left table, matched rows from the right.
--            If no match exists, right-side columns come back as NULL.
-- RIGHT JOIN: the mirror — ALL rows from the right table, matched rows from the left.

-- Example 1 — which countries have a prime minister on record?
-- Some countries in `countries` won't appear in `prime_ministers`.
-- A LEFT JOIN reveals those gaps (NULL in prime_minister column).

SELECT c.name AS country, pm.prime_minister
FROM countries AS c
LEFT JOIN prime_ministers AS pm
    ON c.name = pm.country
ORDER BY c.name
LIMIT 10;

-- Example 2 — RIGHT JOIN produces the same shape but from the other direction.
-- Every prime_ministers row is kept; countries with no match → NULL on left side.

SELECT c.name AS country, pm.prime_minister
FROM countries AS c
RIGHT JOIN prime_ministers AS pm
    ON c.name = pm.country;
