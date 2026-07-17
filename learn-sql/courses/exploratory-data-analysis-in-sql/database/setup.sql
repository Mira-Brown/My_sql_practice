-- ============================================================
-- setup.sql — build the PostgreSQL DB for
-- "Exploratory Data Analysis in SQL"
-- ============================================================
-- Two dataset groups:
--   * company / tag_company / tag_type / stackoverflow / fortune500
--       — companies, their StackOverflow tags, question activity, financials
--   * evanston311
--       — help requests to the city of Evanston, IL (messy text + dates)
--
-- Run from the database/ directory so the \copy paths (../csv/*) resolve:
--     psql -v ON_ERROR_STOP=1 -d eda -f setup.sql
-- or use ./setup.sh which creates the DB first.
--
-- NOTE: data loads via \copy from the LOCAL csv/ files (no internet/superuser
-- needed). The original DataCamp script used COPY ... FROM PROGRAM 'curl …';
-- the CSVs are already vendored under csv/, so \copy is used instead.
-- ============================================================

set time zone 'UTC';

-- ------------------------------------------------------------
-- 1. Drop existing objects (child tables first)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS evanston311;
DROP TABLE IF EXISTS stackoverflow;
DROP TABLE IF EXISTS tag_type;
DROP TABLE IF EXISTS tag_company;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS fortune500;

-- ------------------------------------------------------------
-- 2. evanston311 — one row per 311 help request
-- ------------------------------------------------------------
CREATE TABLE evanston311 (
  id             int PRIMARY KEY,
  priority       varchar(6),
  source         varchar(20),
  category       varchar(64),
  date_created   timestamp with time zone,
  date_completed timestamp with time zone,
  street         varchar(48),
  house_num      varchar(12),
  zip            char(5),
  description    text
);

-- ------------------------------------------------------------
-- 3. company + tag tables (self-referencing FK on company.parent_id)
-- ------------------------------------------------------------
CREATE TABLE company (
  id        int PRIMARY KEY,
  exchange  varchar(10),
  ticker    char(5) UNIQUE,
  name      varchar NOT NULL,
  parent_id int REFERENCES company(id)
);

CREATE TABLE tag_company (
  tag        varchar(30) PRIMARY KEY,
  company_id int REFERENCES company(id)
);

CREATE TABLE stackoverflow (
  id              serial,
  tag             varchar(30) REFERENCES tag_company(tag),
  date            date,
  question_count  integer DEFAULT 0,
  question_pct    double precision,
  unanswered_count integer,
  unanswered_pct  double precision
);

CREATE TABLE tag_type (
  id   serial,
  tag  varchar(30) REFERENCES tag_company(tag),
  type varchar(30)
);

-- ------------------------------------------------------------
-- 4. fortune500 — company financials
-- ------------------------------------------------------------
CREATE TABLE fortune500 (
  rank            int NOT NULL,
  title           varchar PRIMARY KEY,
  name            varchar NOT NULL UNIQUE,
  ticker          char(5),
  url             varchar,
  hq              varchar,
  sector          varchar,
  industry        varchar,
  employees       int CHECK (employees > 0),
  revenues        int,
  revenues_change real,
  profits         numeric,
  profits_change  real,
  assets          numeric CHECK (assets > 0),
  equity          numeric
);

-- ------------------------------------------------------------
-- 5. Seed the small reference tables (must precede FK-referencing loads)
-- ------------------------------------------------------------
INSERT INTO company VALUES
(1, 'nasdaq', 'PYPL', 'PayPal Holdings Incorporated', NULL),
(2, 'nasdaq', 'AMZN', 'Amazon.com Inc', NULL),
(3, 'nasdaq', 'MSFT', 'Microsoft Corp.', NULL),
(4, 'nasdaq', 'MDB', 'MongoDB', NULL),
(5, 'nasdaq', 'DBX', 'Dropbox', NULL),
(6, 'nasdaq', 'AAPL', 'Apple Incorporated', NULL),
(7, 'nasdaq', 'CTXS', 'Citrix Systems', NULL),
(8, 'nasdaq', 'GOOGL', 'Alphabet', NULL),
(9, 'nyse', 'IBM', 'International Business Machines Corporation', NULL),
(10, 'nasdaq', 'ADBE', 'Adobe Systems Incorporated', NULL),
(11, NULL, NULL, 'Stripe', NULL),
(12, NULL, NULL, 'Amazon Web Services', 2),
(13, NULL, NULL, 'Google LLC', 8),
(14, 'nasdaq', 'EBAY', 'eBay, Inc.', NULL);

INSERT INTO tag_company (tag, company_id) VALUES
('actionscript', 10),
('actionscript-3', 10),
('amazon', 2),
('amazon-api', 2),
('amazon-appstore', 2),
('amazon-cloudformation', 12),
('amazon-cloudfront', 12),
('amazon-cloudsearch', 12),
('amazon-cloudwatch', 12),
('amazon-cognito', 12),
('amazon-data-pipeline', 12),
('amazon-dynamodb', 12),
('amazon-ebs', 12),
('amazon-ec2', 12),
('amazon-ecs', 12),
('amazon-elastic-beanstalk', 12),
('amazon-elasticache', 12),
('amazon-elb', 12),
('amazon-emr', 12),
('amazon-fire-tv', 2),
('amazon-glacier', 12),
('amazon-kinesis', 12),
('amazon-lambda', 12),
('amazon-mws', 12),
('amazon-rds', 12),
('amazon-rds-aurora', 12),
('amazon-redshift', 12),
('amazon-route53', 12),
('amazon-s3', 12),
('amazon-ses', 12),
('amazon-simpledb', 12),
('amazon-sns', 12),
('amazon-sqs', 12),
('amazon-swf', 12),
('amazon-vpc', 12),
('amazon-web-services', 12),
('android', 13),
('android-pay', 13),
('applepay', 6),
('applepayjs', 6),
('azure', 3),
('citrix', 7),
('cognos', 9),
('dropbox', 5),
('dropbox-api', 5),
('excel', 3),
('google-spreadsheet', 13),
('ios', 6),
('ios8', 6),
('ios9', 6),
('mongodb', 4),
('osx', 6),
('paypal', 1),
('sql-server', 3),
('stripe-payments', 11),
('windows', 3);

INSERT INTO tag_type (tag, type) VALUES
('amazon-cloudformation', 'cloud'),
('amazon-cloudfront', 'cloud'),
('amazon-cloudsearch', 'cloud'),
('amazon-cloudwatch', 'cloud'),
('amazon-cognito', 'cloud'),
('amazon-cognito', 'identity'),
('amazon-data-pipeline', 'cloud'),
('amazon-dynamodb', 'cloud'),
('amazon-dynamodb', 'database'),
('amazon-ebs', 'cloud'),
('amazon-ec2', 'cloud'),
('amazon-ecs', 'cloud'),
('amazon-elastic-beanstalk', 'cloud'),
('amazon-elasticache', 'cloud'),
('amazon-elb', 'cloud'),
('amazon-emr', 'cloud'),
('amazon-glacier', 'cloud'),
('amazon-glacier', 'storage'),
('amazon-kinesis', 'cloud'),
('amazon-lambda', 'cloud'),
('amazon-mws', 'api'),
('amazon-rds-aurora', 'cloud'),
('amazon-rds', 'cloud'),
('amazon-rds-aurora', 'database'),
('amazon-rds', 'database'),
('amazon-redshift', 'cloud'),
('amazon-route53', 'cloud'),
('amazon-s3', 'cloud'),
('amazon-ses', 'cloud'),
('amazon-simpledb', 'cloud'),
('amazon-simpledb', 'database'),
('amazon-sns', 'cloud'),
('amazon-sqs', 'cloud'),
('amazon-swf', 'cloud'),
('amazon-vpc', 'cloud'),
('amazon-web-services', 'cloud'),
('amazon', 'company'),
('android-pay', 'payment'),
('android', 'mobile-os'),
('applepay', 'payment'),
('applepayjs', 'payment'),
('azure', 'cloud'),
('citrix', 'company'),
('dropbox-api', 'api'),
('dropbox-api', 'api'),
('dropbox-api', 'api'),
('dropbox', 'storage'),
('dropbox', 'cloud'),
('dropbox', 'company'),
('excel', 'spreadsheet'),
('google-spreadsheet', 'spreadsheet'),
('ios', 'mobile-os'),
('ios8', 'mobile-os'),
('ios9', 'mobile-os'),
('mongodb', 'database'),
('osx', 'os'),
('paypal', 'payment'),
('paypal', 'company'),
('sql-server', 'database'),
('stripe-payments', 'payment'),
('windows', 'os');

-- ------------------------------------------------------------
-- 6. Bulk-load the big tables from local CSVs (headers present, NA = NULL)
-- ------------------------------------------------------------
\copy stackoverflow (tag, date, question_count, question_pct, unanswered_count, unanswered_pct) FROM '../csv/stackexchange.csv' WITH (FORMAT csv, HEADER true, NULL 'NA')
\copy evanston311 FROM '../csv/ev311.csv' WITH (FORMAT csv, HEADER true, NULL 'NA')
\copy fortune500 FROM '../csv/fortune.csv' WITH (FORMAT csv, HEADER true, NULL 'NA')

-- ------------------------------------------------------------
-- 7. Indexes to make the teaching joins/aggregations snappy
-- ------------------------------------------------------------
CREATE INDEX ON tag_company (company_id);
CREATE INDEX ON stackoverflow (tag);
CREATE INDEX ON stackoverflow (date);
CREATE INDEX ON tag_type (tag);
CREATE INDEX ON company (parent_id);
CREATE INDEX ON fortune500 (sector);
CREATE INDEX ON fortune500 (ticker);
CREATE INDEX ON evanston311 (category);
CREATE INDEX ON evanston311 (date_created);
CREATE INDEX ON evanston311 (date_completed);

-- ------------------------------------------------------------
-- 8. Row-count sanity check
--    Expected: evanston311 36431, fortune500 500, stackoverflow 45238,
--              company 14, tag_company 56, tag_type 61
-- ------------------------------------------------------------
SELECT 'evanston311'   AS table, count(*) FROM evanston311
UNION ALL SELECT 'fortune500',    count(*) FROM fortune500
UNION ALL SELECT 'company',       count(*) FROM company
UNION ALL SELECT 'tag_company',   count(*) FROM tag_company
UNION ALL SELECT 'tag_type',      count(*) FROM tag_type
UNION ALL SELECT 'stackoverflow', count(*) FROM stackoverflow
ORDER BY table;
