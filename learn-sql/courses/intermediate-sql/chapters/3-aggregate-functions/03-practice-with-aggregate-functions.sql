-- Exercise: Practice with aggregate functions
-- Objective: Apply aggregate functions to answer real questions about the films dataset.
--
-- Instructions:
--   1. What is the average duration (in minutes) of all films? Alias as avg_duration.
--   2. What is the highest gross a film has ever earned? Alias as max_gross.
--   3. How many films have a non-NULL language? Alias as count_language.
--
-- Write each as its own SELECT statement.

-- TODO: Write your queries below

SELECT AVG(duration) AS avg_duration,
       MAX(gross) AS max_gross,
       COUNT(language) AS count_language
FROM films;