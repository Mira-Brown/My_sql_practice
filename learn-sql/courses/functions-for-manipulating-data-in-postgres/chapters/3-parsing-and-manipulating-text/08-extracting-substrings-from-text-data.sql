-- Lesson 8: Extracting substrings from text data
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Parse email addresses into their components
-- Objective: Use SUBSTRING() and POSITION() together to extract dynamic slices.
--
-- Instructions:
--   1. From the customer table, select email.
--   2. Add a column called local_part — everything before the '@'.
--      Hint: SUBSTRING(email FROM 1 FOR POSITION('@' IN email) - 1)
--   3. Add a column called domain — everything after the '@'.
--      Hint: SUBSTRING(email FROM POSITION('@' IN email) + 1)
--   4. Add a column called tld — the last 3 characters of email (the top-level domain).
--      Hint: RIGHT(email, 3)
--   5. Limit to 10 rows.

SELECT
    email,
    SUBSTRING(email FROM 1 FOR POSITION('@' IN email) - 1) AS local_part,
    SUBSTRING(email FROM POSITION('@' IN email) + 1) AS domain,
    RIGHT(email, 3) AS tld
FROM customer
LIMIT 10;
