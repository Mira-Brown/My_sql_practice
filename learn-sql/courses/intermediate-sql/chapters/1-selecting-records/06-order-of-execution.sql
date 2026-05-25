-- Exercise: Order of Execution
-- Objective: Apply knowledge of SQL execution order to write correct queries
--
-- Instructions:
--   1. Select title and gross from films, aliasing gross as earnings.
--      Then sort the results by earnings (you CAN use the alias here — why?).
--
--   2. Select title and language from films where language is 'French'.
--      Use the real column name in WHERE, not an alias.
--
--   3. The query below is broken — fix it so it runs correctly:
--
--        SELECT title, release_year AS yr
--        FROM films
--        WHERE yr >= 2010;

-- TODO: 1. title + gross aliased as earnings, sorted by earnings
SELECT title,
       gross AS earnings
FROM films
ORDER BY earnings;       

-- TODO: 2. title + language for French-language films only
SELECT title,
       language
FROM films
WHERE language = 'French'

-- TODO: 3. Fixed version of the broken query
SELECT title, 
       release_year AS yr
FROM films
WHERE release_year >= 2010;
