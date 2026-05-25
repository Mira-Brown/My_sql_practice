-- Lesson 9: Filtering Text
-- Type: Video (▶)
--
-- LIKE   — pattern matching with wildcards
-- %      — any sequence of characters (including none)
-- _      — exactly one character
-- NOT LIKE — inverts the match
-- SQLite LIKE is case-insensitive for ASCII

-- Titles starting with 'The'
SELECT title
FROM films
WHERE title LIKE 'The%';

-- Titles containing 'love' anywhere
SELECT title
FROM films
WHERE title LIKE '%love%';

-- Titles that do NOT start with 'The'
SELECT title
FROM films
WHERE title NOT LIKE 'The%';
