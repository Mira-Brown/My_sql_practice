-- Lesson 8: Answering business questions (▶ Video)
-- Translating plain-English questions into GROUP BY + ORDER BY queries.

-- "What are the top 5 languages by total gross for films released after 2000?"
SELECT language, SUM(gross) AS total_gross
FROM films
WHERE release_year > 2000
GROUP BY language
ORDER BY total_gross DESC
LIMIT 5;
