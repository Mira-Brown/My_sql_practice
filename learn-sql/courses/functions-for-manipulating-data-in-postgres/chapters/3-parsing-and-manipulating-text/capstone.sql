-- ============================================================
-- CAPSTONE — Chapter 3: Parsing and Manipulating Text
-- ============================================================
-- Engine: PostgreSQL — Sakila DVD-rental database.
--
-- Scenario: The Sakila marketing team needs a customer outreach
-- report. They want a single query over the customer table (joined
-- to address and city) that produces a clean, formatted output
-- ready to drop into a mail-merge template.
--
-- Requirements — produce these columns:
--
--   1. customer_id
--
--   2. full_name
--      Title-cased "Firstname Lastname"
--      e.g. 'Mary Smith'
--
--   3. salutation
--      "Dear Firstname," — INITCAP first_name, trimmed, then appended with ','
--      e.g. 'Dear Mary,'
--
--   4. account_code
--      Zero-padded customer_id (5 digits) + '-' + first 3 chars of
--      UPPER(last_name) + first 3 chars of UPPER(first_name)
--      e.g. customer_id=1, MARY SMITH → '00001-SMIMAR'
--
--   5. masked_email
--      Replace the local part (everything before '@') with '***'
--      e.g. '***@sakilacustomer.org'
--      Hint: REPLACE(email, SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1), '***')
--
--   6. city_label
--      RPAD(INITCAP(city.city), 20, '.') — city name padded to 20 chars with dots
--      e.g. 'Lethbridge..........''
--      Join: customer → address → city
--
--   7. name_len
--      CHAR_LENGTH of full_name (the INITCAP version, not raw)
--
--   8. active_flag
--      CASE WHEN active = 1 THEN 'ACTIVE' ELSE 'INACTIVE' END
--
-- Filters:
--   - active customers only (active = 1)
--   - full_name length > 12 characters
--
-- Order: full_name ASC
-- Limit: 20 rows
-- ============================================================

-- Write your query below:

SELECT
    c.customer_id,
    INITCAP(c.first_name || ' ' || c.last_name) AS full_name,
    'Dear ' || INITCAP(TRIM(c.first_name)) || ',' AS salutation,
    LPAD(c.customer_id::text, 5, '0') || '-' 
        || LEFT(UPPER(c.last_name), 3) 
        || LEFT(UPPER(c.first_name), 3) AS account_code,
    REPLACE(
        c.email, 
        SUBSTRING(c.email FROM 1 FOR POSITION('@' IN c.email)-1), 
        '***'
    ) AS masked_email,
    RPAD(INITCAP(ci.city), 20, '.') AS city_label,
    CHAR_LENGTH(INITCAP(c.first_name || ' ' || c.last_name)) AS name_len,
    CASE WHEN c.active = 1 THEN 'ACTIVE' ELSE 'INACTIVE' END AS active_flag
FROM customer AS c
    INNER JOIN address AS a ON c.address_id = a.address_id
    INNER JOIN city AS ci ON a.city_id = ci.city_id
WHERE 
    c.active = 1
    AND CHAR_LENGTH(INITCAP(c.first_name || ' ' || c.last_name)) > 12
ORDER BY full_name ASC
LIMIT 20;
