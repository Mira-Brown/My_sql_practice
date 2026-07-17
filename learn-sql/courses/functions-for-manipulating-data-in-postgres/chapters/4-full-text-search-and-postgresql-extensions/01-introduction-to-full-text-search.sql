-- Lesson 1: Introduction to full-text search
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — Sakila DB (psql -d sakila)
--
-- LIKE: case-sensitive literal match — returns 0 rows because titles are uppercase
SELECT title FROM film WHERE title LIKE '%elf%';

-- ILIKE fixes case but still can't stem or rank
SELECT title FROM film WHERE title ILIKE '%elf%';

-- Full-text search: stemmed, language-aware, composable
-- to_tsvector() tokenises the document; to_tsquery() is the search expression
-- @@ is the match operator
SELECT title, description
FROM film
WHERE to_tsvector('english', title) @@ to_tsquery('english', 'elf');

-- See the raw tsvector to understand what's being indexed:
SELECT to_tsvector('english', 'The elf was running quickly through the forest');
-- result: 'elf':2 'forest':8 'quick':5 'run':4 — stop words removed, stems kept
