-- Lesson 1: Sorting results (▶ Video)
-- ORDER BY controls row order in your result set.
-- Default is ASC (ascending). Add DESC for descending.

-- Top 10 highest-grossing films
SELECT title, gross
FROM films
ORDER BY gross DESC
LIMIT 10;
