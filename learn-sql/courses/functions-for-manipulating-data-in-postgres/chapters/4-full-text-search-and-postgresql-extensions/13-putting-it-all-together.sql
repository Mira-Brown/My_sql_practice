-- Lesson 13: Putting it all together
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- Scenario: A customer calls in and says their last name is "JOHNSON" but may
-- have misspelled it. You want to surface all near-matches using both approaches:
--   - levenshtein: catches typos (edit distance)
--   - similarity:  catches phonetic/structural overlap (trigram score)
-- Using OR between them gives the widest net.
--
-- Exercise: Fuzzy customer name lookup combining levenshtein and similarity
-- Objective: Find customers whose last name is close to 'JOHNSON' by either
--            metric, showing both scores side by side.
--

SELECT
   first_name, last_name,
    levenshtein(last_name, 'JOHNSON') AS lev,
    similarity(last_name, 'JOHNSON') AS sim
FROM customer
WHERE
    levenshtein(last_name, 'JOHNSON') <= 3
    OR similarity(last_name, 'JOHNSON') > 0.4
ORDER BY lev ASC, sim DESC
;
