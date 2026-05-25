-- Lesson 2: Learning to COUNT()
-- Type: Theory (☰)
--
-- COUNT(*) — counts all rows (NULLs included)
-- COUNT(col) — counts only non-NULL values in that column

-- Example 1: total number of films
SELECT COUNT(*)
FROM films;

-- Example 2: films where language is recorded (not NULL)
SELECT COUNT(language)
FROM films;

-- Example 3: compare both in one query
SELECT COUNT(*) AS total_films, COUNT(language) AS films_with_language
FROM films;
