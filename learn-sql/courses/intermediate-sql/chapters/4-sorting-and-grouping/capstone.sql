 -- Capstone: Chapter 4 — Sorting and Grouping
-- Brief: You are a data analyst at a film studio reviewing market trends.
-- Answer each business question below using a single SQL query per section.
--
-- You have access to the films table:
-- films(id, title, release_year, country, duration, language, certification, gross, budget)

-- ─────────────────────────────────────────────
-- Q1. Which 5 certifications generate the highest average gross?
--     Show certification and avg_gross rounded to 0 decimal places.
--     Exclude rows where gross is NULL.
--     Order by avg_gross descending.
-- ─────────────────────────────────────────────
SELECT certification, ROUND(AVG(gross), 0) AS avg_gross
FROM films
WHERE gross IS NOT NULL 
GROUP BY certification
ORDER BY avg_gross DESC 
LIMIT 5;

-- ─────────────────────────────────────────────
-- Q2. How many films were released per decade since 1960?
--     Show decade and film_count.
--     Order by decade ascending.
-- ─────────────────────────────────────────────
SELECT (release_year / 10) * 10 AS decade, COUNT(*) AS film_count
FROM films
WHERE release_year >= 1960
GROUP BY decade
ORDER BY decade ASC;


-- ─────────────────────────────────────────────
-- Q3. Which countries had a total gross above 500 million
--     for films released between 2000 and 2015 inclusive?
--     Show country and total_gross.
--     Order by total_gross descending.
-- ─────────────────────────────────────────────
SELECT country, SUM(gross) AS total_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2015
GROUP BY country
HAVING SUM(gross) > 500000000
ORDER BY total_gross DESC;


-- ─────────────────────────────────────────────
-- Q4. Find the top 3 languages by number of films,
--     but only include languages with more than 20 films
--     and exclude NULL languages.
--     Show language and film_count.
-- ─────────────────────────────────────────────
SELECT language, COUNT(*) film_count
FROM films
WHERE language IS NOT NULL 
GROUP BY language
HAVING COUNT(*) > 20
ORDER BY film_count DESC
LIMIT 3;

