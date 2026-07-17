-- Lesson 3: Spotting character data problems
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Before recoding, find the problems. The usual suspects:
--   * Case:     'Rodents- Rats' vs 'rodents- rats'  -> lower()/upper()
--   * Spaces:   ' Trash '   -> trim(), ltrim(), rtrim()
--   * Length:   overly long free-text values        -> length(), left()
--
-- Example — categories that differ only by case collapse when lowercased:
SELECT lower(category) AS category, count(*)
FROM evanston311
GROUP BY lower(category)
ORDER BY count DESC
LIMIT 5;
