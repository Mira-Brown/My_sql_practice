-- Lesson 7: Read an entity relationship diagram
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- An ERD shows tables (boxes) and the FK links (lines) between them. Reading it
-- tells you the join path. To reach a company's StackOverflow activity:
--   company -> tag_company (company_id) -> stackoverflow (tag)
--
-- Example — total questions tagged for one company:
SELECT c.name, sum(so.question_count) AS questions
FROM company AS c
JOIN tag_company AS tc ON c.id = tc.company_id
JOIN stackoverflow AS so ON tc.tag = so.tag
WHERE c.name = 'Dropbox'
GROUP BY c.name;

-- Exercise: Read an entity relationship diagram
-- Objective: Follow the ERD path to count how many distinct tags each company
--            owns.
-- Instructions:
--   1. Join company to tag_company on id = company_id.
--   2. Count distinct tags per company.
--   3. Order by the count descending.

-- TODO: write your query below
SELECT c.name, count(DISTINCT tc.tag) AS num_tags
FROM company AS c
JOIN tag_company AS tc ON c.id = tc.company_id
GROUP BY c.name
ORDER BY num_tags DESC;
