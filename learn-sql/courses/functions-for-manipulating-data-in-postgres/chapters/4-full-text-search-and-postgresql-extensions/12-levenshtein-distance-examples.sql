-- Lesson 12: Levenshtein distance examples
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d sakila
--
-- levenshtein(source, target) counts the minimum number of single-character
-- edits (insertions, deletions, substitutions) to turn source into target.
--   levenshtein('JONES', 'JONES') = 0  (identical)
--   levenshtein('JONES', 'JAMES') = 2  (two substitutions)
--   levenshtein('JONES', 'BONE')  = 2  (one deletion + one substitution)
--
-- Lower = more similar. Use <= to set a maximum edit distance threshold.
--
-- Exercise: Find customers whose last name is close to 'JONES'
-- Objective: Use levenshtein() to surface near-matches in the customer table,
--            simulating a fuzzy name lookup for a customer service rep.
--
--Solution

SELECT
    first_name, 
    last_name, 
    levenshtein(last_name, 'JONES') AS distance
FROM customer
WHERE
    levenshtein(last_name, 'JONES') <= 2
ORDER BY distance ASC, last_name ASC
;
