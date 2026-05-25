-- Lesson 8: SQL Style
-- Type: Video (▶)
--
-- Style rules:
--   - UPPERCASE keywords (SELECT, FROM, WHERE, ORDER BY)
--   - lowercase table and column names
--   - one clause per line
--   - indent continuation lines
--   - always end with a semicolon
--   - avoid SELECT * — name your columns explicitly

-- Poor style (works, but hard to read)
-- select title,release_year,country from films where country='USA'

-- Good style
SELECT title,
       release_year,
       country
FROM films
WHERE country = 'USA';
