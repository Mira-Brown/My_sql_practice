-- Chapter 1 Capstone: Dataset Scoping Report
--
-- Brief:
--   You've just joined a film analytics team. Before any analysis can begin,
--   the team needs a scoping report that answers basic questions about
--   the dataset's size and coverage.
--
--   Write one well-formatted query per question below.
--   All queries must follow SQL best practices: UPPERCASE keywords,
--   lowercase identifiers, named columns with aliases, semicolons.
--
-- Questions:
--
--   1. How many films are in the database?
--      (alias: total_films)
--
--   2. How many unique release years does the dataset span?
--      (alias: years_covered)
--
--   3. How many films have a recorded gross AND a recorded budget?
--      Hint: you'll need two COUNT(column) calls in one query.
--      (aliases: films_with_gross, films_with_budget)
--
--   4. How many distinct countries and distinct languages are represented?
--      Both in a single query.
--      (aliases: country_count, language_count)
--
--   5. Pull a sample of 5 films showing: title, release_year, country,
--      and language. This will be used as a preview in the report.
--      Hint: use LIMIT to cap results at 5.

-- Q1. 
SELECT COUNT(title) AS total_films
FROM films;

-- Q2.
SELECT COUNT(DISTINCT release_year) AS years_covered
FROM films;

-- Q3.
SELECT COUNT(gross) AS films_with_gross,
       COUNT(budget) AS films_with_budget
FROM films;	

-- Q4.
SELECT  COUNT(DISTINCT country ) AS country_count,
        COUNT(DISTINCT language) AS language_count
FROM films;

-- Q5.
SELECT title,
       release_year,
       country,
       language
FROM films
LIMIT 5;       
