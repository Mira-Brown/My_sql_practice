-- Lesson 7: Splitting and concatenating text
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- Combine and break apart text:
--   * concat(a, b, ...) or the || operator — join strings
--   * left(str, n) / right(str, n)         — take n characters
--   * split_part(str, delimiter, n)        — the n-th piece around a delimiter
--   * length(str)                          — number of characters
--
-- Example — build a full address, and pull the first word of a category:
SELECT house_num || ' ' || street                AS address,
       split_part(category, ' - ', 1)            AS category_group
FROM evanston311
LIMIT 5;
