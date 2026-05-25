-- Lesson 13: NULL Values
-- Type: Video (▶)
--
-- NULL = missing/unknown — not zero, not empty string
-- Never use = NULL or <> NULL — always IS NULL / IS NOT NULL

-- Films with no language recorded
SELECT title, language
FROM films
WHERE language IS NULL;

-- Films with a gross recorded
SELECT title, gross
FROM films
WHERE gross IS NOT NULL;

-- People with no recorded birthdate
SELECT name, birthdate
FROM people
WHERE birthdate IS NULL;
