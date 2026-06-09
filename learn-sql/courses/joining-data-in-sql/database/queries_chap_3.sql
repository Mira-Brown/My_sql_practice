SELECT *
FROM economies;

SELECT code, year, income_group
FROM economies2015
UNION ALL
SELECT code, year, income_group
FROM economies2019;

SELECT country, continent
FROM prime_ministers
UNION ALL
SELECT country, continent
FROM monarchs
ORDER BY country

SELECT country, continent
FROM prime_ministers
UNION 
SELECT country, continent
FROM monarchs
ORDER BY country

SELECT country, continent 
FROM prime_ministers
INTERSECT
SELECT country FROM presidents;

SELECT name
FROM countries
INTERSECT
SELECT name
FROM cities
ORDER BY name;


-- Objective: Use EXCEPT to find monarchs whose continent has no prime minister.
--
-- Instructions:
--   1. SELECT continent FROM monarchs
--      EXCEPT
--      SELECT continent FROM prime_ministers
--   2. ORDER BY continent

-- TODO: Write your query here
SELECT continent
FROM monarchs
EXCEPT
SELECT continent
FROM prime_ministers
ORDER BY continent;

SELECT code, year, income_group
FROM economies2015
INTERSECT
SELECT code, year, income_group
FROM economies2019
ORDER BY code;

-- Capstone: Chapter 3 — Set Theory for SQL Joins
--
-- You are a data analyst at a global economics research firm.
-- Your manager wants a report on economy coverage and leadership structures
-- across the dataset. Answer the following three questions using set operators.
--
-- Question 1 (UNION ALL):
--   Build a full timeline of economy snapshots.
--   Select code, year, gross_savings FROM economies2015
--   UNION ALL economies2019
--   ORDER BY code, year
--
-- Question 2 (EXCEPT):
--   Which country codes had economy data in 2015 but are MISSING from 2019?
--   These are gaps in the dataset your team needs to investigate.
--   Select code FROM economies2015 EXCEPT economies2019
--   ORDER BY code
--
-- Question 3 (INTERSECT):
--   Which continents have BOTH a monarch AND a prime minister?
--   Select continent FROM monarchs INTERSECT prime_ministers
--   ORDER BY continent
--
-- Attempt all three. Say `check it` when done.

-- TODO: Question 1 — Full economy timeline (UNION ALL)
SELECT code, year, gross_savings
FROM economies2015
UNION ALL
SELECT code, year, gross_savings
FROM economies2019
ORDER BY code, year;


-- TODO: Question 2 — Missing in 2019 (EXCEPT)
SELECT code
FROM economies2015
EXCEPT
SELECT code
FROM economies2019
ORDER BY code;

-- TODO: Question 3 — Continents with both monarch and prime minister (INTERSECT)
SELECT continent
FROM monarchs
INTERSECT
SELECT continent
FROM prime_ministers
ORDER BY continent;

