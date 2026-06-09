-- Lesson: FULL JOINs
-- See: ../../assets/full_join2.png

-- FULL JOIN = LEFT JOIN + RIGHT JOIN combined.
-- ALL rows from BOTH tables are returned.
-- Where no match exists on either side, NULLs fill in.

-- Example: countries vs prime_ministers
-- Some countries have no prime minister on record → NULL on right.
-- All prime ministers are kept regardless of country match.

SELECT c.name AS country, pm.prime_minister
FROM countries AS c
FULL JOIN prime_ministers AS pm
    ON c.name = pm.country
ORDER BY c.name
LIMIT 15;
