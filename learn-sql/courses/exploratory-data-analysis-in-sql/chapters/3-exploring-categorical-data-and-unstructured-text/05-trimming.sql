-- Lesson 5: Trimming
-- Type: Exercise </> (100 XP)
-- Engine: PostgreSQL — psql -d eda
--

-- trim(chars FROM string) removes the given characters from BOTH ends.
-- ltrim / rtrim trim one side. Default trims spaces.
--
-- Example — strip leading digits and spaces from a house number sample:
SELECT house_num, trim(house_num, '0123456789 ') AS trimmed
FROM evanston311
WHERE house_num IS NOT NULL
LIMIT 5;

-- Exercise: Trimming
-- Objective: From the street column, remove any leading house-number digits and
--            spaces to isolate the street name.
-- Instructions:
--   1. Use ltrim(street, '0123456789 ') to drop leading digits/spaces.
--   2. Return the original and trimmed values for 10 rows.

-- TODO: write your query below
SELECT street, ltrim(street, '0123456789 ') AS street_name
FROM evanston311
WHERE street IS NOT NULL
LIMIT 10;
