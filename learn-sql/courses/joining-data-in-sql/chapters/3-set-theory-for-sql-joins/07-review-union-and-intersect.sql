-- Theory: Review UNION and INTERSECT
--
-- UNION     — all rows from both sets, duplicates removed
-- UNION ALL — all rows from both sets, duplicates kept
-- INTERSECT — only rows that appear in BOTH sets, duplicates removed
--
-- Hard rule: same column count, same order, compatible types across both SELECTs.

-- UNION: unique list of countries across monarchs + presidents
SELECT country FROM monarchs
UNION
SELECT country FROM presidents
ORDER BY country;

-- UNION ALL: every entry kept (duplicates visible)
SELECT country FROM monarchs
UNION ALL
SELECT country FROM presidents
ORDER BY country;

-- INTERSECT: countries in BOTH tables
SELECT country FROM monarchs
INTERSECT
SELECT country FROM presidents;
