-- Lesson 5: Extending PostgreSQL
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- See which extensions are currently installed in this database:
SELECT name, default_version, installed_version
FROM pg_available_extensions
WHERE installed_version IS NOT NULL
ORDER BY name;
-- Result: fuzzystrmatch 1.2, pg_trgm 1.6, plpgsql 1.0

-- Enable an extension (safe to re-run; IF NOT EXISTS prevents errors):
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
