-- Lesson 4: Join tables
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Foreign keys let you JOIN related tables. fortune500.ticker matches
-- company.ticker, connecting Fortune-500 financials to StackOverflow tags.
--
-- Example — companies present in BOTH tables:
SELECT company.name, fortune500.rank
FROM company
JOIN fortune500 ON company.ticker = fortune500.ticker;

-- Exercise: Join tables
-- Objective: For each company that appears in fortune500, show its title,
--            rank, and the number of employees.
-- Instructions:
--   1. Join company to fortune500 on ticker.
--   2. Select company.name, fortune500.title, rank, employees.
--   3. Order by rank.

-- TODO: write your query below
SELECT company.name, fortune500.title, fortune500.rank, fortune500.employees
FROM company
JOIN fortune500 ON company.ticker = fortune500.ticker
ORDER BY fortune500.rank;
