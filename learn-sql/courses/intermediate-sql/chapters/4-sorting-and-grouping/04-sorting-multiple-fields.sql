-- Exercise: Sorting multiple fields
-- Objective: Use ORDER BY with multiple columns to control sort priority.
--
-- Instructions:
--   1. Select title, release_year, and duration from films.
--      Sort by release_year ascending, then by duration descending.
--      (Within each year, longest film first.)
--      Limit to 15 results.
--
--   2. Select title, certification, and gross from films.
--      Sort by certification ascending, then by gross descending.
--      (Within each certification group, highest earner first.)
--      Limit to 20 results.

-- Query 1
-- TODO: SELECT title, release_year, duration FROM films
--       ORDER BY release_year ASC, duration DESC
--       LIMIT 15

SELECT title,
       release_year,
       duration
FROM films
ORDER BY release_year ASC, duration DESC 
LIMIT 15;      


-- Query 2
-- TODO: SELECT title, certification, gross FROM films
--       ORDER BY certification ASC, gross DESC
--       LIMIT 20
SELECT title,
       certification,
       gross
FROM films
ORDER BY certification ASC, gross DESC 
LIMIT 20;      