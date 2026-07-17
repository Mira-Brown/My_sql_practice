-- Lesson 2: Concatenating strings
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — Sakila DVD-rental DB (sakila)
--
-- Exercise: Build a customer directory
-- Objective: Use CONCAT() and the || operator to combine text columns
--            into display-ready labels for a customer mailing list.
--
-- Instructions:
--   1. Select customer_id, first_name, and last_name from the customer table.
--   2. Add a column called full_name using CONCAT() that joins
--      first_name, a space, and last_name.
--   3. Add a column called email_label using the || operator that produces:
--      "Firstname Lastname <email>"  (e.g. "MARY SMITH <mary.smith@sakilacustomer.org>")
--      Hint: combine first_name, ' ', last_name, ' <', email, '>'
--   4. Limit to 10 rows.

SELECT
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name,
    first_name || ' ' || last_name || ' <' || email || '>' AS email_label
FROM customer
LIMIT 10;
