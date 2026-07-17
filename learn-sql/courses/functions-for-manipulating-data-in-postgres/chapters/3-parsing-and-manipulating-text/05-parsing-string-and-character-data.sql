-- Lesson 5: Parsing string and character data
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Key parsing functions:
--   CHAR_LENGTH(text)                  → number of characters
--   POSITION(substring IN text)        → start position (1-based), 0 if not found
--   SUBSTRING(text FROM start FOR len) → extract a slice
--   LEFT(text, n)                      → first n characters
--   RIGHT(text, n)                     → last n characters

-- Mini-example: dissect a customer email into its parts
SELECT
    email,
    CHAR_LENGTH(email)                                   AS email_len,
    POSITION('@' IN email)                               AS at_pos,
    LEFT(email, POSITION('@' IN email) - 1)              AS local_part,
    SUBSTRING(email FROM POSITION('@' IN email) + 1)     AS domain
FROM customer
LIMIT 5;
