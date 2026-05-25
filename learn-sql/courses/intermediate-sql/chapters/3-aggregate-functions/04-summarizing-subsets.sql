-- Lesson 3.4: Summarizing Subsets (Video)
-- Combine WHERE with aggregate functions to summarize a subset of rows.
-- WHERE filters first, then the aggregate runs on the remaining rows.

-- Example: average budget of films released from 2000 onwards
SELECT AVG(budget) AS avg_budget_2000s
FROM films
WHERE release_year >= 2000;

-- Example: total gross of English-language films
SELECT SUM(gross) AS total_english_gross
FROM films
WHERE language = 'English';

-- Example: how many films are certified 'PG-13'?
SELECT COUNT(id) AS pg13_count
FROM films
WHERE certification = 'PG-13';
