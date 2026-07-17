-- Lesson 14: Create a temp table to simplify a query
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Pre-aggregating into a temp table turns a gnarly multi-join query into a few
-- simple ones. Build the summary once, reuse it many times.
--
-- Example — questions per company saved once:
CREATE TEMP TABLE company_questions AS
SELECT c.id, c.name, sum(so.question_count) AS questions
FROM company AS c
JOIN tag_company AS tc ON c.id = tc.company_id
JOIN stackoverflow AS so ON tc.tag = so.tag
GROUP BY c.id, c.name;

-- Exercise: Create a temp table to simplify a query
-- Objective: From company_questions, list the 5 companies with the most
--            questions.
-- Instructions:
--   1. SELECT name, questions FROM the temp table.
--   2. Order by questions descending, limit 5.

-- TODO: write your query below
SELECT name, questions
FROM company_questions
ORDER BY questions DESC
LIMIT 5;
