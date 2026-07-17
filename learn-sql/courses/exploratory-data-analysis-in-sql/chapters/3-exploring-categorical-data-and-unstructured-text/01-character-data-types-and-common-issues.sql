-- Lesson 1: Character data types and common issues
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Character types:
--   * char(n)    — fixed length, PADDED with spaces to n
--   * varchar(n) — variable length, max n
--   * text       — variable length, unlimited
--
-- Categorical data stored as text gets messy: inconsistent CASE ('Trash' vs
-- 'trash'), leading/trailing SPACES, and stray punctuation all split what should
-- be one category into many. Cleaning is step one of exploring it.
--
-- Example — how many distinct categories does evanston311 record?
SELECT count(DISTINCT category) AS n_categories
FROM evanston311;
