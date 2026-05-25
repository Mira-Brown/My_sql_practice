-- Lesson 11: Non-standard Fields
-- Type: Theory (☰)
--
-- Non-standard identifiers (spaces, special chars, reserved words)
-- must be wrapped in quotes so the database treats them as names.
--
-- SQLite / PostgreSQL: "double quotes"
-- MySQL:               `backticks`
-- SQL Server:          [square brackets]

-- Our films table uses clean snake_case, so no quoting needed.
-- This query works normally:
SELECT title,
       release_year
FROM films;

-- If the column were named "release year" (a space), it would be:
-- SELECT title, "release year" FROM films;
