-- Exercise: USING in action
-- Objective: Simplify an INNER JOIN using the USING keyword.
--
-- When both tables share a column with the EXACT same name, you can replace:
--   ON c.code = l.code
-- with:
--   USING (code)
--
-- Instructions:
--   1. SELECT country name (from countries, alias 'c') and language name (from languages, alias 'l').
--   2. INNER JOIN languages onto countries.
--   3. Instead of ON c.code = l.code, use USING (code).
--   4. Filter to only official languages (official = 'TRUE').
--   5. LIMIT to 10 rows.

SELECT c.name AS country,
       l.name AS language
FROM countries AS c
INNER JOIN languages AS l USING (code)
WHERE official = 'TRUE'
LIMIT 10;
