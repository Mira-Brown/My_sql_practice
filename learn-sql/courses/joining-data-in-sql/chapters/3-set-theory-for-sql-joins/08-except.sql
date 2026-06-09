-- Lesson: EXCEPT
-- See: ../../assets/except.png

-- EXCEPT returns rows in the FIRST set that are NOT in the SECOND.
-- Order matters — swapping the sides changes the result entirely.

-- Monarchs whose country does NOT appear in presidents
SELECT country FROM monarchs
EXCEPT
SELECT country FROM presidents;

-- Flip it: presidents whose country does NOT appear in monarchs
SELECT country FROM presidents
EXCEPT
SELECT country FROM monarchs;
