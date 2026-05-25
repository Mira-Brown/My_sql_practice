-- Lesson 5: Grouping data (▶ Video)
-- GROUP BY collapses rows sharing the same value into one group.
-- Aggregate functions then run per group, not across the whole table.

-- How many films per country? (sorted most to least)
SELECT country, COUNT(*) AS film_count
FROM films
GROUP BY country
ORDER BY film_count DESC;
