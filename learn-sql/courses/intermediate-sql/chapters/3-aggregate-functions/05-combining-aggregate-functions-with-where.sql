-- Exercise: Combining aggregate functions with WHERE
-- Objective: Use WHERE to summarize specific subsets of data.
--
-- Instructions:
--   1. What was the total gross earned by films released in 2000 or later?
--      Alias as total_gross.
--   2. What is the average duration of films with a budget over 50 million?
--      Alias as avg_duration.
--   3. What is the highest imdb_score among reviews with more than 100 critic reviews?
--      Alias as top_score. (use the reviews table)
--
-- Write each as its own SELECT statement.

-- TODO: Write your queries below


SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;

 
SELECT AVG(duration) AS avg_duration
FROM films
WHERE budget > 50000000;

 
SELECT MAX(imdb_score) AS top_score
FROM reviews 
WHERE num_critic_reviews > 100