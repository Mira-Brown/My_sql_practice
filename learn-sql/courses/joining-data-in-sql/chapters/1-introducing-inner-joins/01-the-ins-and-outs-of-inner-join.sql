-- Lesson 1: The ins and outs of INNER JOIN
-- See: ../../assets/inner_join2.png

-- INNER JOIN returns rows where a match exists in BOTH tables.
-- Rows with no match on either side are excluded.

-- Syntax:
--   SELECT A.col, B.col
--   FROM A
--   INNER JOIN B ON A.key = B.key;

-- Example: get each city alongside its country name and continent.
-- countries.code matches cities.country_code — that's the join key.

SELECT cities.name AS city,
       countries.name AS country,
       countries.continent
FROM cities
INNER JOIN countries ON countries.code = cities.country_code
LIMIT 10;
