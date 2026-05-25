-- Exercise: Rounding results
-- Objective: Use ROUND() with aggregates and arithmetic to produce clean output.
--
-- Instructions:
--   1. What is the average imdb_score for films with more than 50 user reviews?
--      Round to 1 decimal place. Alias as avg_score.
--      (imdb_score is in reviews; num_user_reviews is also in reviews)
--
--   2. What is the average ratio of gross to budget for films where both are
--      greater than zero? This tells you how many times over a film earned
--      back its budget on average.
--      Round to 2 decimal places. Alias as avg_return_ratio.

-- TODO: Write your queries below

SELECT ROUND(AVG(imdb_score), 1) AS avg_score
FROM reviews
WHERE num_user_reviews >50; 

SELECT ROUND(AVG(gross/budget), 2) AS avg_return_ratio
FROM films
WHERE gross > 0 AND budget > 0;