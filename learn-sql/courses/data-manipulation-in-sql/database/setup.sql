-- setup.sql — build data-manipulation-in-sql.db from CSVs
-- Run from this dir: sqlite3 data-manipulation-in-sql.db < setup.sql
--
-- Dataset: European Soccer Database (subset used by DataCamp's
-- "Data Manipulation in SQL" course).
--   csv/country.csv — one row per country
--   csv/league.csv  — one row per domestic league
--   csv/team.csv    — one row per club
--   csv/match.csv   — one row per played match
--
-- All CSVs include header rows; .import --skip 1 strips them.

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS match;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS league;
DROP TABLE IF EXISTS country;

CREATE TABLE country (
    id   INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE league (
    id         INTEGER PRIMARY KEY,
    country_id INTEGER,   -- FK → country.id
    name       TEXT
);

CREATE TABLE team (
    id              INTEGER PRIMARY KEY,
    team_api_id     INTEGER,   -- referenced by match.hometeam_id / awayteam_id
    team_long_name  TEXT,
    team_short_name TEXT
);

CREATE TABLE match (
    id          INTEGER PRIMARY KEY,
    country_id  INTEGER,   -- FK → country.id
    season      TEXT,      -- e.g. '2011/2012'
    stage       INTEGER,   -- matchday / round number
    date        TEXT,      -- raw source format (M/D/YY H:MM)
    hometeam_id INTEGER,   -- → team.team_api_id
    awayteam_id INTEGER,   -- → team.team_api_id
    home_goal   INTEGER,
    away_goal   INTEGER
);

.mode csv
.import --skip 1 ../csv/country.csv country
.import --skip 1 ../csv/league.csv  league
.import --skip 1 ../csv/team.csv    team
.import --skip 1 ../csv/match.csv   match

-- Coerce empty strings imported as '' into proper NULLs
UPDATE league SET country_id = NULLIF(country_id,'');
UPDATE team   SET team_api_id = NULLIF(team_api_id,'');
UPDATE team   SET team_short_name = NULLIF(team_short_name,'');
UPDATE match  SET stage      = NULLIF(stage,'');
UPDATE match  SET hometeam_id = NULLIF(hometeam_id,'');
UPDATE match  SET awayteam_id = NULLIF(awayteam_id,'');
UPDATE match  SET home_goal  = NULLIF(home_goal,'');
UPDATE match  SET away_goal  = NULLIF(away_goal,'');

-- Indexes on common FK / join columns
CREATE INDEX idx_league_country_id   ON league(country_id);
CREATE INDEX idx_team_team_api_id    ON team(team_api_id);
CREATE INDEX idx_match_country_id    ON match(country_id);
CREATE INDEX idx_match_hometeam_id   ON match(hometeam_id);
CREATE INDEX idx_match_awayteam_id   ON match(awayteam_id);
CREATE INDEX idx_match_season        ON match(season);

PRAGMA foreign_keys = ON;

-- Row counts
.headers on
.mode column
SELECT 'country' AS table_name, COUNT(*) AS rows FROM country
UNION ALL SELECT 'league', COUNT(*) FROM league
UNION ALL SELECT 'team',   COUNT(*) FROM team
UNION ALL SELECT 'match',  COUNT(*) FROM match;
