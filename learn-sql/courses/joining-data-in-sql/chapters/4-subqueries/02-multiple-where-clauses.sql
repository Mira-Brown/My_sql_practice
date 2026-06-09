-- Exercise: Multiple WHERE clauses
-- Objective: Use a semi join to filter prime ministers to only those whose
--            country also has a monarch.
-- Instructions:
--   1. SELECT country and prime_minister from prime_ministers.
--   2. Filter using WHERE so only rows where the country also appears
--      in the monarchs table are returned.

-- TODO: Write a semi join using a subquery in WHERE

SELECT country, prime_minister
FROM prime_ministers
WHERE country IN (
    SELECT country FROM monarchs);