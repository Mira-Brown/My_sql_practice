-- ============================================================
-- CAPSTONE — Chapter 1: What is a database?
-- ============================================================
-- Engine: PostgreSQL — psql -d eda
--
-- Scenario: You just inherited this database and must write a one-page
-- "data dictionary" describing the company/tag dataset and its integrity.
--
-- Requirements:
--   1. Report the row count of company, tag_company, tag_type, stackoverflow.
--   2. Report how many companies are missing a ticker (NULL).
--   3. List each company with: its number of distinct tags, and the total
--      StackOverflow question_count summed across those tags.
--      (Path: company -> tag_company -> stackoverflow.)
--   4. Use COALESCE so companies with no StackOverflow rows show 0, not NULL.
--   5. Order by total questions descending.
-- ============================================================

-- Reference query (Requirement 3-5):
SELECT c.name,
       count(DISTINCT tc.tag)                 AS num_tags,
       coalesce(sum(so.question_count), 0)    AS total_questions
FROM company AS c
LEFT JOIN tag_company AS tc ON c.id = tc.company_id
LEFT JOIN stackoverflow AS so ON tc.tag = so.tag
GROUP BY c.name
ORDER BY total_questions DESC;
