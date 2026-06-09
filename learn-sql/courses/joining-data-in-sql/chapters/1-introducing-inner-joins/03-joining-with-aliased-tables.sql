-- Exercise: Joining with aliased tables
-- Objective: Rewrite a multi-column join using table aliases to keep the query concise.
-- Instructions:
--   1. Alias the countries table as 'c' and the languages table as 'l'.
--   2. SELECT:
--        - country name (from c)
--        - continent (from c)
--        - language name (from l)
--        - whether the language is official (from l)
--   3. INNER JOIN languages onto countries using the shared code column.
--   4. Use your aliases everywhere — on the JOIN, the ON clause, and all SELECT columns.

SELECT c.name AS country,
       c.continent,
       l.name AS language,
       l.official
FROM countries AS c
INNER JOIN languages AS l ON c.code = l.code
LIMIT 15;
