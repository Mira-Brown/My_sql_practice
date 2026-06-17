-- Semi join: presidents whose country is also in prime_ministers
SELECT country, president
FROM presidents
WHERE country IN (
    SELECT country FROM prime_ministers
);

-- Anti join: presidents whose country has NO prime minister
SELECT country, president
FROM presidents
WHERE country NOT IN (
    SELECT country FROM prime_ministers
);

-- Countries that have a monarch
SELECT code, name
FROM countries
WHERE code IN (
    SELECT code FROM currencies
);

-- Objective: Use a semi join to filter prime ministers to only those whose
--            country also has a monarch.
SELECT country, prime_minister
FROM prime_ministers
WHERE country IN (
    SELECT country FROM monarchs);

-- Objective: Use a semi join to find languages spoken in the Middle East.
-- Instructions:
--   1. SELECT DISTINCT name from the languages table, aliased as language.
--   2. ORDER BY language ascending.
--   3. Filter with WHERE so only languages spoken in countries
--      in the Middle East region (from the countries table) are returned.
--      Use a subquery inside WHERE to get the country codes for the Middle East.

-- TODO: Write your semi join here

SELECT DISTINCT name AS language
FROM languages 
WHERE code IN (
    SELECT code FROM countries
    WHERE region = 'Middle East'
);

-- Objective: Use an anti join to find currencies used by Oceanian countries
--            that are NOT in the economies table.
-- Instructions:
--   1. SELECT code and name from the countries table.
--   2. Filter to only countries in the continent 'Oceania'.
--   3. Add a second WHERE condition using NOT IN so that only countries
--      whose code does NOT appear in the economies table are returned.
--   4. ORDER BY code ascending.

-- TODO: Write your anti join here

SELECT code , name
FROM countries
WHERE code NOT IN (SELECT code FROM economies) 
AND continent = 'Oceania'
ORDER BY code ASC;	

-- Countries with above-average GDP per capita
SELECT name
FROM countries
WHERE code IN (
    SELECT code FROM economies
    WHERE gdp_percapita > (
        SELECT AVG(gdp_percapita) FROM economies
    )
);
	
-- Objective: Find countries with a fertility rate higher than the average
--            fertility rate in 2015.
-- Instructions:
--   1. SELECT country_code and fertility_rate from the populations table.
--   2. Filter to year = 2015.
--   3. Add a WHERE condition so only rows where fertility_rate is greater than
--      the average fertility_rate for 2015 are returned.
--      Use a subquery inside WHERE to calculate that average.
--   4. ORDER BY fertility_rate DESC.

-- TODO: Write your query here

SELECT country_code, fertility_rate
FROM populations
WHERE year = 2015 
AND fertility_rate > (SELECT AVG(fertility_rate)
                      FROM populations
                      WHERE year = 2015)
ORDER BY fertility_rate DESC;	
	
-- Objective: Find countries whose population size in 2015 was greater than
--            the average population size across all countries in 2015.
-- Instructions:
--   1. SELECT country_code and size from the populations table.
--   2. Alias size as pop_size.
--   3. Filter to year = 2015.
--   4. Use a subquery inside WHERE to filter to only countries whose size
--      is above the average size for 2015.
--   5. ORDER BY pop_size DESC.

-- TODO: Write your query here

SELECT country_code, size AS pop_size
FROM populations
WHERE year = 2015
AND size >(SELECT AVG(size)
           FROM populations
           WHERE year = 2015)
ORDER BY pop_size DESC; 

SELECT c1.name,
       (SELECT COUNT(*)
        FROM cities c2
        WHERE c2.country_code = c1.code) AS cities_num
FROM countries c1
ORDER BY cities_num DESC;

-- Objective: For each continent, count how many countries are in the
--            countries table and show it alongside the continent name.
-- Instructions:
--   1. SELECT continent from the countries table.
--   2. Add a second column using a subquery in SELECT that counts the number
--      of countries in the countries table that share the same continent
--      as the outer query row. Alias it as countries_num.
--   3. ORDER BY countries_num DESC.

-- Hint: The subquery needs to reference the outer query's continent value.
--       Use WHERE c2.continent = c1.continent inside the subquery,
--       where c1 is the alias for the outer table and c2 for the inner.

-- TODO: Write your query here


SELECT c1.continent,
       (SELECT COUNT(*)
        FROM countries c2
        WHERE c2.continent = c1.continent) AS countries_num
FROM countries c1
ORDER BY countries_num DESC;

-- Exercise: Subquery inside FROM
-- Objective: For each continent, find the maximum inflation rate in 2015,
--            then return only continents where that max is below 10%.
-- Instructions:
--   1. Write an inner query that SELECTs continent and MAX(inflation_rate)
--      aliased as max_inf, by JOINing countries and economies on code,
--      filtering to year = 2015, and grouping by continent.
--   2. Wrap that as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT continent and max_inf from subq.
--   4. Filter the outer query to only rows WHERE max_inf < 10.
--   5. ORDER BY max_inf ASC.

-- TODO: Write your query here
SELECT continent, max_inf
FROM (
    SELECT c.continent, MAX(e.inflation_rate) AS max_inf
    FROM countries AS c
    JOIN economies AS e ON c.code = e.code
    WHERE e.year = 2015
    GROUP BY c.continent
) AS subq
WHERE max_inf < 10
ORDER BY max_inf ASC;

-- Objective: Find the top 5 most densely populated countries in 2015
--            (population size divided by surface area).
-- Instructions:
--   1. Write an inner query that SELECTs country_code and
--      size / surface_area AS pop_density, by JOINing populations and
--      countries on populations.country_code = countries.code,
--      filtering to year = 2015.
--   2. Wrap it as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT country_code and pop_density from subq.
--   4. ORDER BY pop_density DESC.
--   5. LIMIT to 5 rows.

-- TODO: Write your query here

SELECT country_code, pop_density
FROM (
    SELECT populations.country_code, 
    populations.size / countries.surface_area AS pop_density
    FROM populations
    JOIN countries ON populations.country_code = countries.code
    WHERE populations.year = 2015
) AS subq
ORDER BY pop_density DESC
LIMIT 5;

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
ORDER BY c.name ASC

-- Objective: For each continent, find the maximum inflation rate in 2015,
--            then return only continents where that max is below 10%.
-- Instructions:
--   1. Write an inner query that SELECTs continent and MAX(inflation_rate)
--      aliased as max_inf, by JOINing countries and economies on code,
--      filtering to year = 2015, and grouping by continent.
--   2. Wrap that as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT continent and max_inf from subq.
--   4. Filter the outer query to only rows WHERE max_inf < 10.
--   5. ORDER BY max_inf ASC.

-- TODO: Write your query here
SELECT continent, max_inf
FROM (
    SELECT c.continent, MAX(e.inflation_rate) AS max_inf
    FROM countries AS c
    JOIN economies AS e ON c.code = e.code
    WHERE e.year = 2015
    GROUP BY c.continent
) AS subq
WHERE max_inf < 10
ORDER BY max_inf ASC;

-- Objective: Find the top 5 most densely populated countries in 2015
--            (population size divided by surface area).
-- Instructions:
--   1. Write an inner query that SELECTs country_code and
--      size / surface_area AS pop_density, by JOINing populations and
--      countries on populations.country_code = countries.code,
--      filtering to year = 2015.
--   2. Wrap it as a subquery in FROM, aliased as subq.
--   3. In the outer query, SELECT country_code and pop_density from subq.
--   4. ORDER BY pop_density DESC.
--   5. LIMIT to 5 rows.

-- TODO: Write your query here

SELECT country_code, pop_density
FROM (
    SELECT p.country_code, 
    p.size / c.surface_area AS pop_density
    FROM populations As p
    JOIN countries AS c ON p.country_code = c.code
    WHERE p.year = 2015
) AS subq
ORDER BY pop_density DESC
LIMIT 5;          

SELECT *
FROM countries;

SELECT *
FROM languages;

SELECT *
FROM populations;

SELECT *
FROM economies;
