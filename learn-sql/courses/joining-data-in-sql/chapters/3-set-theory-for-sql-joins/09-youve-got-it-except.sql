-- Exercise: You've got it, EXCEPT...
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