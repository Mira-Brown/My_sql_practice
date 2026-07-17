-- Lesson 3: Count missing values
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Missing (NULL) values are not counted by count(column), but every row is
-- counted by count(*). The difference = number of NULLs.
--
-- Example — how many companies have NO ticker symbol?
SELECT count(*) - count(ticker) AS missing
FROM company;

-- Exercise: Count missing values
-- Objective: Find which fortune500 columns have missing values by comparing
--            count(*) to count(column).
-- Instructions:
--   1. Select count(*) as total rows.
--   2. Subtract count(industry) and count(sector) to reveal missing counts.

-- TODO: write your query below
SELECT count(*)                        AS total,
       count(*) - count(industry)      AS missing_industry,
       count(*) - count(sector)        AS missing_sector,
       count(*) - count(profits_change) AS missing_profits_change
FROM fortune500;
