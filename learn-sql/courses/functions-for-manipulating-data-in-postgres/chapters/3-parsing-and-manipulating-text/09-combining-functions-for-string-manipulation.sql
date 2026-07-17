-- Lesson 9: Combining functions for string manipulation
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Build a customer username generator
-- Objective: Nest and chain multiple string functions in a single expression.
--
-- Instructions:
--   1. From the customer table, select customer_id, first_name, last_name, email.
--   2. Add a column called username built by combining:
--        - The first 3 characters of first_name (UPPER case)
--        - The first 3 characters of last_name (UPPER case)
--        - The last 3 characters of email (the TLD, LOWER case)
--      Result should look like: 'MARSMILOR' → 'MAR' + 'SMI' + 'org'
--      Wait — format it as: LEFT(UPPER(first_name), 3) || LEFT(UPPER(last_name), 3) || LOWER(RIGHT(email, 3))
--   3. Add a column called account_len — the CHAR_LENGTH of username.
--   4. Filter to customers whose last_name starts with 'S'.
--      Hint: SUBSTRING(last_name FROM 1 FOR 1) = 'S'  OR use LEFT(last_name, 1) = 'S'
--   5. Order by last_name, first_name.
--   6. Limit to 10 rows.

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    LEFT(UPPER(first_name), 3) || LEFT(UPPER(last_name), 3) || LOWER(RIGHT(email, 3)) AS username,
    CHAR_LENGTH(LEFT(UPPER(first_name), 3) || LEFT(UPPER(last_name), 3) || LOWER(RIGHT(email, 3))) AS account_len
FROM customer
WHERE LEFT(last_name, 1) = 'S'
ORDER BY last_name, first_name
LIMIT 10;
