-- Lesson 5: The keys to the database
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- A PRIMARY KEY uniquely identifies each row (no NULLs, no duplicates).
-- A FOREIGN KEY references a primary key in another table, enforcing that
-- related rows actually exist.
--
-- In this DB:
--   company.id            — PK        company.parent_id -> company.id (self-ref)
--   tag_company.tag       — PK        tag_company.company_id -> company.id
--   stackoverflow.tag     — FK -> tag_company.tag
--   tag_type.tag          — FK -> tag_company.tag
--   fortune500.title      — PK        fortune500.name — UNIQUE
--
-- See a table's constraints:
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'company';
