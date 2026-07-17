-- Lesson 12: The TRIM function
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Clean up messy string literals
-- Objective: Use TRIM(), LTRIM(), and RTRIM() to strip unwanted characters.
--
-- Syntax:
--   TRIM([LEADING|TRAILING|BOTH] [chars] FROM text)
--   LTRIM(text, chars)   → strip chars from LEFT  (defaults to spaces)
--   RTRIM(text, chars)   → strip chars from RIGHT (defaults to spaces)
--
-- Instructions:
-- You are given a query that produces intentionally dirty string literals.
-- For each dirty value, add a cleaned column using the appropriate trim function.
--
--   1. '   ACADEMY DINOSAUR   ' → trim spaces from both sides → 'ACADEMY DINOSAUR'
--      Use: TRIM('   ACADEMY DINOSAUR   ')
--
--   2. '###GOLDFINGER###'       → strip '#' from both sides   → 'GOLDFINGER'
--      Use: TRIM(BOTH '#' FROM '###GOLDFINGER###')
--
--   3. '   ADAPTATION'          → strip leading spaces only   → 'ADAPTATION'
--      Use: LTRIM('   ADAPTATION')
--
--   4. 'AFFAIR   '              → strip trailing spaces only  → 'AFFAIR'
--      Use: RTRIM('AFFAIR   ')
--
-- Build a single SELECT that returns four columns:
--   dirty1, clean1, dirty2, clean2, dirty3, clean3, dirty4, clean4
-- Use literal strings (no table needed — just SELECT without FROM).

SELECT
    '   ACADEMY DINOSAUR   '          AS dirty1,
    TRIM('   ACADEMY DINOSAUR   ')    AS clean1,
    '###GOLDFINGER###'                AS dirty2,
    TRIM(BOTH '#' FROM '###GOLDFINGER###') AS clean2,
    '   ADAPTATION'                   AS dirty3,
    LTRIM('   ADAPTATION')            AS clean3,
    'AFFAIR   '                       AS dirty4,
    RTRIM('AFFAIR   ')                AS clean4;