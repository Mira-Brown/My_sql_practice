-- Lesson 9: Filtering grouped data (☰ Theory)
-- WHERE filters rows before grouping. HAVING filters groups after aggregation.

-- Countries with more than 50 films released from 2000 onwards
SELECT country, COUNT(*) AS film_count
FROM films
WHERE release_year >= 2000
GROUP BY country
HAVING COUNT(*) > 50;
