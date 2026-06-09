-- Lesson: Subquerying with semi joins and anti joins (Video)
-- Semi join  → keep rows in A where a match EXISTS in B  (WHERE col IN subquery)
-- Anti join  → keep rows in A where NO match exists in B (WHERE col NOT IN subquery)
-- Only the left table's columns appear in the output.

-- Semi join: presidents whose country also has a prime minister
SELECT country, president
FROM presidents
WHERE country IN (
    SELECT country FROM prime_ministers
);
-- Result: Egypt, India, Pakistan, Portugal

-- Anti join: presidents whose country has NO prime minister
SELECT country, president
FROM presidents
WHERE country NOT IN (
    SELECT country FROM prime_ministers
);
-- Result: USA, Uruguay, Chile
