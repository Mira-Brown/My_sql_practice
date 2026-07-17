-- ============================================================
-- CAPSTONE — Chapter 3: Exploring Categorical Data and Unstructured Text
-- ============================================================
-- Engine: PostgreSQL — psql -d eda
--
-- Scenario: The city wants a cleaned category report from the messy evanston311
-- free-text data.
--
-- Requirements:
--   1. Build a TEMP TABLE recode mapping each raw category to a standardized
--      group = the text before the first ' - ', trimmed and lowercased.
--   2. Roll any standardized group with fewer than 100 total requests into
--      'other'.
--   3. Report, per final group: request count, and the count whose description
--      mentions 'rat' (ILIKE) as an indicator column.
--   4. Order by request count descending.
-- ============================================================

-- Reference query:
CREATE TEMP TABLE recode AS
SELECT DISTINCT category AS raw,
       lower(trim(split_part(category, ' - ', 1))) AS standard
FROM evanston311;

-- promote rare groups to 'other'
UPDATE recode
SET standard = 'other'
WHERE standard IN (
    SELECT lower(trim(split_part(category, ' - ', 1))) AS standard
    FROM evanston311
    GROUP BY lower(trim(split_part(category, ' - ', 1)))
    HAVING count(*) < 100
);

SELECT r.standard,
       count(*)                                                AS requests,
       count(*) FILTER (WHERE e.description ILIKE '%rat%')     AS mentions_rat
FROM evanston311 AS e
JOIN recode AS r ON e.category = r.raw
GROUP BY r.standard
ORDER BY requests DESC;
