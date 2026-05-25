-- Lesson 14: What Does NULL Mean?
-- Type: Theory (☰)
--
-- Three reasons a value is NULL:
--   1. Not applicable  — field doesn't apply to this row
--   2. Not yet known   — data exists but wasn't captured
--   3. Data quality    — value was lost or never entered
--
-- NULL propagates: 5 + NULL = NULL
-- NULL excluded from COUNT(col), SUM, AVG
-- NULL = NULL is unknown, not true — use IS NULL

-- How many films are missing a language?
SELECT COUNT(*) - COUNT(language) AS missing_language
FROM films;

-- How many people have no recorded birthdate?
SELECT COUNT(*) - COUNT(birthdate) AS missing_birthdate
FROM people;
