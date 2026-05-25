-- Lesson 3.8: Aliasing and Arithmetic (Video)
-- SQL supports +, -, *, / directly in SELECT.
-- Always alias calculated columns — they have no natural name.

-- Example: profit per film (gross minus budget)
SELECT title,
       gross - budget AS profit
FROM films
WHERE budget > 0
LIMIT 10;

-- Example: average profit across all films
SELECT AVG(gross - budget) AS avg_profit
FROM films
WHERE budget > 0;

-- Example: budget as a percentage of gross
SELECT title,
       ROUND(budget * 100.0 / gross, 1) AS budget_pct_of_gross
FROM films
WHERE gross > 0 AND budget > 0
LIMIT 10;
