-- Lesson: At the INTERSECT
-- See: ../../assets/intersect_two_columns.png

-- INTERSECT returns only rows found in BOTH result sets.
-- Same column count + order rule applies as UNION.

-- Countries that have BOTH a prime minister AND a president
SELECT country FROM prime_ministers
INTERSECT
SELECT country FROM presidents;

-- Add continent — both columns must match exactly across both sides
SELECT country, continent FROM prime_ministers
INTERSECT
SELECT country, continent FROM presidents;
