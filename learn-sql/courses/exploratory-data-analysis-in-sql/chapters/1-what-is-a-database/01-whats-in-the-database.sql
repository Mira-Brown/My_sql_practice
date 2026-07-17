-- Lesson 1: What's in the database?
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Before analyzing data, learn what tables exist and how they relate.
-- This DB has two dataset groups:
--   * fortune500 + company + tag_company + tag_type + stackoverflow
--       — companies, their StackOverflow tags, and question activity
--   * evanston311 — help requests to the city of Evanston, IL (messy text + dates)
--
-- List every table PostgreSQL knows about in this database:
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- Peek at the fortune500 companies:
SELECT rank, title, sector, revenues, profits
FROM fortune500
ORDER BY rank
LIMIT 10;
