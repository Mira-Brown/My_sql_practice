-- Lesson 2: Filtering Results
-- Type: Theory (☰)
--
-- Numbers:  no quotes      WHERE release_year = 2000
-- Text:     single quotes  WHERE country = 'USA'
-- Dates:    single quotes  WHERE birthdate = '1970-01-01'
--
-- Double quotes = identifiers (column/table names)
-- Single quotes = text values
-- Text comparisons are case-sensitive

-- Number filter
SELECT title, release_year
FROM films
WHERE release_year = 2000;

-- Text filter — note single quotes
SELECT title, country
FROM films
WHERE country = 'USA';
