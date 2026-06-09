-- Exercise: Final challenge
-- Objective: Return the name and country code of every country whose
--            capital city has a higher urban area population than
--            the average urban area population across all cities.
-- Instructions:
--   1. SELECT country_code and name from the countries table (alias as c).
--   2. Use a subquery in WHERE to filter to countries whose capital city
--      appears in the cities table AND has an urbanarea_pop greater than
--      the average urbanarea_pop across all cities.
--      (Hint: the cities table has a 'name' column for city name,
--       and countries has a 'capital' column — match them.)
--   3. ORDER BY name ASC.

-- TODO: Write your query here

SELECT c.code, c.name
FROM countries AS c
WHERE c.capital IN (
    SELECT name
    FROM cities
    WHERE urbanarea_pop > (
        SELECT AVG(urbanarea_pop)
        FROM cities
    )
)
ORDER BY c.name ASC;