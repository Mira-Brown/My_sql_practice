-- Exercise: Relationships in our database
-- Objective: Explore the 1:M relationship between countries and currencies.
--
-- Instructions:
--   1. Alias countries as 'c' and currencies as 'cu'.
--   2. SELECT:
--        - country name (c.name AS country)
--        - the basic currency unit (cu.basic_unit AS currency)
--        - the currency code (cu.curr_code)
--   3. INNER JOIN currencies onto countries USING (code).
--   4. Filter to countries in the continent 'Oceania'.
--   5. ORDER BY country name ascending.

SELECT c.name AS country,
       cu.basic_unit AS currency,
      cu.curr_code
FROM countries AS c
INNER JOIN currencies AS cu USING (code)
WHERE continent = 'Oceania'
ORDER BY c.name ASC;
