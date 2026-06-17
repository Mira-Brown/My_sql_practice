-- setup.sql — build the summer_medals table in PostgreSQL
--
-- This course runs on PostgreSQL (NOT SQLite) because it uses
-- Postgres-only features: crosstab() pivots, ROLLUP / CUBE, and the
-- full window-frame syntax (RANGE / ROWS BETWEEN ...).
--
-- Usage (run from this database/ dir so \copy's relative path resolves):
--   createdb postgres_summary_stats
--   psql -v ON_ERROR_STOP=1 -d postgres_summary_stats -f setup.sql
-- or just run ./setup.sh which does the createdb + load for you.
--
-- Dataset: Summer Olympic medals (csv/summer.csv) — one row per medal won.

DROP TABLE IF EXISTS summer_medals;

CREATE TABLE summer_medals (
    year       INTEGER,
    city       TEXT,
    sport      TEXT,
    discipline TEXT,
    athlete    TEXT,
    country    TEXT,    -- 3-letter IOC code (e.g. USA, GBR, HUN)
    gender     TEXT,    -- 'Men' / 'Women'
    event      TEXT,
    medal      TEXT     -- 'Gold' / 'Silver' / 'Bronze'
);

-- Load the CSV (header row skipped). \copy is a psql client-side command,
-- so the path is relative to where you launched psql (this database/ dir).
\copy summer_medals FROM '../csv/summer.csv' WITH (FORMAT csv, HEADER true);

-- tablefunc provides crosstab(), used for the pivoting lessons in Chapter 4.
-- (Requires privileges to create extensions; harmless if already present.)
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Indexes on common filter / partition columns
CREATE INDEX idx_summer_year    ON summer_medals(year);
CREATE INDEX idx_summer_country ON summer_medals(country);
CREATE INDEX idx_summer_medal   ON summer_medals(medal);
CREATE INDEX idx_summer_gender  ON summer_medals(gender);

-- Row count — verify the load (expect 31165)
SELECT COUNT(*) AS rows FROM summer_medals;
