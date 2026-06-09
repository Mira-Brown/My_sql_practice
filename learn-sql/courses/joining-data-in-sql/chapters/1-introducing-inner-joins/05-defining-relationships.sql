-- Lesson 5: Defining relationships
--
-- Relationship types:
--   1:1  — one row in A matches exactly one row in B
--   1:M  — one row in A matches many rows in B  (most common)
--   M:M  — many rows in A match many rows in B  (needs a join table)
--
-- In this database:
--   countries (1) --> (M) cities       via cities.country_code
--   countries (1) --> (M) languages    via languages.code
--   countries (1) --> (M) economies    via economies.code
--
-- Example: how many cities does each country have?
-- This illustrates the 1:M relationship — one country, many cities.

SELECT c.name AS country,
       COUNT(ci.name) AS num_cities
FROM countries AS c
INNER JOIN cities AS ci ON c.code = ci.country_code
GROUP BY c.name
ORDER BY num_cities DESC
LIMIT 10;
