-- setup.sql — build joining-data-in-sql.db from CSVs
-- Run from this dir: sqlite3 joining-data-in-sql.db < setup.sql
--
-- Two dataset groups:
--   csv/countries/* — main DataCamp "Countries" dataset (headers present)
--   csv/leaders/*   — supplementary "Leaders" dataset (headers present)
--
-- All CSVs include header rows; .import --skip 1 strips them.

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS economies;
DROP TABLE IF EXISTS currencies;
DROP TABLE IF EXISTS populations;
DROP TABLE IF EXISTS economies2015;
DROP TABLE IF EXISTS economies2019;
DROP TABLE IF EXISTS eu_countries;
DROP TABLE IF EXISTS states;
DROP TABLE IF EXISTS monarchs;
DROP TABLE IF EXISTS presidents;
DROP TABLE IF EXISTS prime_ministers;
DROP TABLE IF EXISTS prime_minister_terms;

-- countries dataset
CREATE TABLE cities (
    name              TEXT PRIMARY KEY,
    country_code      TEXT,
    city_proper_pop   REAL,
    metroarea_pop     REAL,
    urbanarea_pop     REAL
);

CREATE TABLE countries (
    code         TEXT PRIMARY KEY,
    name         TEXT,
    continent    TEXT,
    region       TEXT,
    surface_area REAL,
    indep_year   INTEGER,
    local_name   TEXT,
    gov_form     TEXT,
    capital      TEXT,
    cap_long     REAL,
    cap_lat      REAL
);

CREATE TABLE languages (
    lang_id  INTEGER PRIMARY KEY,
    code     TEXT,
    name     TEXT,
    percent  REAL,
    official TEXT
);

CREATE TABLE economies (
    econ_id           INTEGER PRIMARY KEY,
    code              TEXT,
    year              INTEGER,
    income_group      TEXT,
    gdp_percapita     REAL,
    gross_savings     REAL,
    inflation_rate    REAL,
    total_investment  REAL,
    unemployment_rate REAL,
    exports           REAL,
    imports           REAL
);

CREATE TABLE currencies (
    curr_id       INTEGER PRIMARY KEY,
    code          TEXT,
    basic_unit    TEXT,
    curr_code     TEXT,
    frac_unit     TEXT,
    frac_perbasic REAL
);

CREATE TABLE populations (
    pop_id          INTEGER PRIMARY KEY,
    country_code    TEXT,
    year            INTEGER,
    fertility_rate  REAL,
    life_expectancy REAL,
    size            REAL
);

CREATE TABLE economies2015 (
    code          TEXT PRIMARY KEY,
    year          INTEGER,
    income_group  TEXT,
    gross_savings REAL
);

CREATE TABLE economies2019 (
    code          TEXT PRIMARY KEY,
    year          INTEGER,
    income_group  TEXT,
    gross_savings REAL
);

CREATE TABLE eu_countries (
    code TEXT PRIMARY KEY,
    name TEXT
);

-- leaders dataset
CREATE TABLE states (
    country    TEXT PRIMARY KEY,
    continent  TEXT,
    indep_year INTEGER
);

CREATE TABLE monarchs (
    country   TEXT PRIMARY KEY,
    continent TEXT,
    monarch   TEXT
);

CREATE TABLE presidents (
    country   TEXT PRIMARY KEY,
    continent TEXT,
    president TEXT
);

CREATE TABLE prime_ministers (
    country        TEXT PRIMARY KEY,
    continent      TEXT,
    prime_minister TEXT
);

CREATE TABLE prime_minister_terms (
    prime_minister TEXT,
    pm_start       INTEGER
);

-- Load CSVs (headers present -> skip first row)
.mode csv
.import --skip 1 ../csv/countries/cities.csv         cities
.import --skip 1 ../csv/countries/countries.csv      countries
.import --skip 1 ../csv/countries/languages.csv      languages
.import --skip 1 ../csv/countries/economies.csv      economies
.import --skip 1 ../csv/countries/currencies.csv     currencies
.import --skip 1 ../csv/countries/populations.csv    populations
.import --skip 1 ../csv/countries/economies2015.csv  economies2015
.import --skip 1 ../csv/countries/economies2019.csv  economies2019
.import --skip 1 ../csv/countries/eu_countries.csv   eu_countries
.import --skip 1 ../csv/leaders/states.csv               states
.import --skip 1 ../csv/leaders/monarchs.csv             monarchs
.import --skip 1 ../csv/leaders/presidents.csv           presidents
.import --skip 1 ../csv/leaders/prime_ministers.csv      prime_ministers
.import --skip 1 ../csv/leaders/prime_minister_terms.csv prime_minister_terms

-- Empty strings -> NULL on nullable cols
UPDATE cities SET city_proper_pop = NULLIF(city_proper_pop,'');
UPDATE cities SET metroarea_pop   = NULLIF(metroarea_pop,'');
UPDATE cities SET urbanarea_pop   = NULLIF(urbanarea_pop,'');

UPDATE countries SET indep_year = NULLIF(indep_year,'');
UPDATE countries SET region     = NULLIF(region,'');
UPDATE countries SET local_name = NULLIF(local_name,'');
UPDATE countries SET gov_form   = NULLIF(gov_form,'');
UPDATE countries SET capital    = NULLIF(capital,'');
UPDATE countries SET cap_long   = NULLIF(cap_long,'');
UPDATE countries SET cap_lat    = NULLIF(cap_lat,'');

UPDATE economies SET gdp_percapita     = NULLIF(gdp_percapita,'');
UPDATE economies SET gross_savings     = NULLIF(gross_savings,'');
UPDATE economies SET inflation_rate    = NULLIF(inflation_rate,'');
UPDATE economies SET total_investment  = NULLIF(total_investment,'');
UPDATE economies SET unemployment_rate = NULLIF(unemployment_rate,'');
UPDATE economies SET exports           = NULLIF(exports,'');
UPDATE economies SET imports           = NULLIF(imports,'');

UPDATE languages SET percent  = NULLIF(percent,'');
UPDATE languages SET official = NULLIF(official,'');

UPDATE populations SET fertility_rate  = NULLIF(fertility_rate,'');
UPDATE populations SET life_expectancy = NULLIF(life_expectancy,'');
UPDATE populations SET size            = NULLIF(size,'');

-- Indexes on common FK / join columns
CREATE INDEX idx_cities_country_code      ON cities(country_code);
CREATE INDEX idx_languages_code           ON languages(code);
CREATE INDEX idx_economies_code           ON economies(code);
CREATE INDEX idx_economies_year           ON economies(year);
CREATE INDEX idx_currencies_code          ON currencies(code);
CREATE INDEX idx_populations_country_code ON populations(country_code);
CREATE INDEX idx_populations_year         ON populations(year);
CREATE INDEX idx_countries_continent      ON countries(continent);

PRAGMA foreign_keys = ON;

-- Row counts
.headers on
.mode column
SELECT 'cities'               AS table_name, COUNT(*) AS rows FROM cities
UNION ALL SELECT 'countries',            COUNT(*) FROM countries
UNION ALL SELECT 'languages',            COUNT(*) FROM languages
UNION ALL SELECT 'economies',            COUNT(*) FROM economies
UNION ALL SELECT 'currencies',           COUNT(*) FROM currencies
UNION ALL SELECT 'populations',          COUNT(*) FROM populations
UNION ALL SELECT 'economies2015',        COUNT(*) FROM economies2015
UNION ALL SELECT 'economies2019',        COUNT(*) FROM economies2019
UNION ALL SELECT 'eu_countries',         COUNT(*) FROM eu_countries
UNION ALL SELECT 'states',               COUNT(*) FROM states
UNION ALL SELECT 'monarchs',             COUNT(*) FROM monarchs
UNION ALL SELECT 'presidents',           COUNT(*) FROM presidents
UNION ALL SELECT 'prime_ministers',      COUNT(*) FROM prime_ministers
UNION ALL SELECT 'prime_minister_terms', COUNT(*) FROM prime_minister_terms;
