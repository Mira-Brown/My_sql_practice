-- Lesson 6: Foreign keys
-- Type: Exercise </> (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- A foreign key guarantees referential integrity: every tag_company.company_id
-- must exist in company.id. Self-referencing keys model hierarchies — here a
-- subsidiary's parent_id points back to its parent company.
--
-- Example — subsidiaries and their parent company name (self-join):
SELECT sub.name AS subsidiary, parent.name AS parent
FROM company AS sub
JOIN company AS parent ON sub.parent_id = parent.id;

-- Exercise: Foreign keys
-- Objective: Confirm every tag_company.company_id references a real company.
-- Instructions:
--   1. LEFT JOIN tag_company to company on company_id = company.id.
--   2. Keep only rows where the company side is NULL (orphans).
--   3. A well-formed FK means this returns zero rows.

-- TODO: write your query below
SELECT tc.tag, tc.company_id
FROM tag_company AS tc
LEFT JOIN company AS c ON tc.company_id = c.id
WHERE c.id IS NULL;
