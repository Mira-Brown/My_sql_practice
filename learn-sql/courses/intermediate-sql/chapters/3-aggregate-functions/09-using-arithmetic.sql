-- Lesson 3.9: Using Arithmetic (Theory)
--
-- Order of operations in SQL follows standard math rules (PEMDAS):
--   * and / before + and -
--   Use parentheses to control order.
--
-- Example: this gives the wrong result without parentheses
--   SELECT gross - budget / 2 FROM films;   -- divides budget by 2, THEN subtracts
--   SELECT (gross - budget) / 2 FROM films; -- subtracts first, THEN divides
--
-- NULL in arithmetic: any expression involving NULL returns NULL
--   50000 - NULL  →  NULL
--   NULL * 3      →  NULL
--
-- Example: films where profit can be calculated (both columns non-NULL)
SELECT title,
       gross - budget AS profit
FROM films
WHERE gross IS NOT NULL AND budget IS NOT NULL
LIMIT 5;
