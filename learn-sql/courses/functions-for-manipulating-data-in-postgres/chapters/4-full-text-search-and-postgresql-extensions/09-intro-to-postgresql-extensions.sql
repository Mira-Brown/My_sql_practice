-- Lesson 9: Intro to PostgreSQL extensions
-- Type: Video ▶ (50 XP)
-- Engine: PostgreSQL — psql -d sakila

-- fuzzystrmatch: edit distance and phonetic codes
SELECT levenshtein('cat', 'bat');         -- 1  (one substitution)
SELECT levenshtein('kitten', 'sitting');  -- 3  (three edits)
SELECT soundex('Robert');                 -- R163
SELECT soundex('Rupert');                 -- R163 (same code — phonetically similar)
SELECT metaphone('Smith', 10);            -- SM0

-- pg_trgm: trigram similarity (0.0 = nothing in common, 1.0 = identical)
SELECT similarity('hello', 'helo');       -- ~0.571
SELECT similarity('hello', 'world');      -- ~0.222
