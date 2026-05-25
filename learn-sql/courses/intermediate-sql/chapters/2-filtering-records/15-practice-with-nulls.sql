-- Exercise: Practice with NULLs
-- Objective: Use IS NULL and IS NOT NULL to find and exclude missing data
--
-- Instructions:
--   1. Select title and language for films where language is missing (NULL).
--
--   2. Select title and gross for films where gross IS NOT NULL,
--      released after 2010.
--
--   3. Count how many people have no recorded deathdate.
--      Alias as still_alive_or_unknown.
--
--   4. Select title for films where BOTH budget AND gross are NULL
--      (completely missing financial data).

-- TODO: 1.
SELECT title, language
FROM films
WHERE language IS NULL;

-- TODO: 2.
SELECT title, gross
FROM films
WHERE gross IS NOT  NULL AND release_year > 2010

-- TODO: 3.
SELECT COUNT(*) AS  still_alive_or_unknown
FROM people
WHERE deathdate IS NULL;

-- TODO: 4.
SELECT title, budget, gross
FROM films
WHERE budget IS NULL AND gross IS NULL;
