-- Lesson 5: Multiple Criteria
-- Type: Video (▶)
--
-- AND   — both conditions must be true
-- OR    — at least one condition must be true
-- BETWEEN x AND y — inclusive range (same as >= x AND <= y)
-- Use parentheses when mixing AND + OR to avoid precedence bugs

-- AND: US films after 2000
SELECT title, release_year, country
FROM films
WHERE release_year > 2000
  AND country = 'USA';

-- OR: films from USA or UK
SELECT title, country
FROM films
WHERE country = 'USA'
   OR country = 'UK';

-- BETWEEN: films from the 1990s (inclusive)
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

-- Mixed AND + OR with parentheses
SELECT title, release_year, country
FROM films
WHERE (country = 'USA' OR country = 'UK')
  AND release_year > 2000;
