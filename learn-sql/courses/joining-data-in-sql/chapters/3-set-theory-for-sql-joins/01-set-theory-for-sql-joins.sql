-- Lesson: Set Theory for SQL Joins
-- See: ../../assets/union.png

-- Set operators stack results VERTICALLY (vs joins which go horizontal).
-- Both SELECT lists must have the same number of columns, same order, compatible types.

-- UNION — monarchs + presidents, no duplicates
SELECT country, monarch AS leader FROM monarchs
UNION
SELECT country, president FROM presidents
ORDER BY country;

-- UNION ALL — keeps every row including duplicates
SELECT country, monarch AS leader FROM monarchs
UNION ALL
SELECT country, president FROM presidents
ORDER BY country;

-- INTERSECT — countries that appear in BOTH tables
SELECT country FROM monarchs
INTERSECT
SELECT country FROM presidents;

-- EXCEPT — monarchs whose country is NOT in presidents
SELECT country FROM monarchs
EXCEPT
SELECT country FROM presidents;
