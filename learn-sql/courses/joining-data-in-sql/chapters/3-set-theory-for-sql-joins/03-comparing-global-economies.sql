-- Exercise: Comparing global economies
-- Objective: Use UNION ALL to stack economy data from two different years.
--
-- Instructions:
--   1. Select country code, year, income_group, gross_savings FROM economies
--      WHERE year = 2015
--   2. UNION ALL with the same columns FROM economies WHERE year = 2019
--   3. ORDER the result BY code, year

-- TODO: Write your query here
SELECT code, year, income_group, gross_savings 
FROM economies
WHERE year = 2015
UNION ALL
SELECT code, year, income_group, gross_savings
FROM economies
WHERE year = 2019
ORDER BY code, year;