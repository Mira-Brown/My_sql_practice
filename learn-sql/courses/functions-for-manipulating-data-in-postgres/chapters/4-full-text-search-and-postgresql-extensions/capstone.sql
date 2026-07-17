-- ============================================================
-- CAPSTONE — Chapter 4: Full-text Search and PostgreSQL Extensions
-- ============================================================
-- Engine: PostgreSQL — psql -d sakila
--
-- Scenario: You're building two tools for a DVD rental store's staff portal.
--
-- ─────────────────────────────────────────────────────────────
-- PART 1 — Film catalogue search
-- ─────────────────────────────────────────────────────────────
-- A staff member types "astronaut" in the search bar.
-- Return a ranked list of matching films using full-text search.
--
-- Requirements:
--   a. Select title, description, and rating from film.
--   b. Use to_tsvector('english', description) @@ to_tsquery('english', 'astronaut')
--      to find matching films.
--   c. Add a fourth column: similarity(title, 'ASTRONAUT') AS title_sim
--      so staff can see how prominent the word is in the title too.
--   d. Filter: only include films with rating IN ('G', 'PG', 'PG-13')
--      (family-friendly shelf).
--   e. Order by title_sim DESC, then title ASC
--.
-- ─────────────────────────────────────────────────────────────
-- PART 2 — Fuzzy customer lookup
-- ─────────────────────────────────────────────────────────────
-- A customer calls in and says their surname is "MILLER" (possibly misspelled).
-- Return all close matches from the customer table.
--
-- Requirements:
--   a. Select first_name, last_name, email, and
--      levenshtein(last_name, 'MILLER') AS lev from customer.
--   b. Filter where lev <= 2.
--   c. Order by lev ASC, last_name ASC.

-- ─── PART 1 ──────────────────────────────────────────────────
-- TODO: film catalogue full-text search with similarity ranking
SELECT 
    title, 
    description,
    rating,
    similarity(title, 'ASTRONAUT') AS title_sim
FROM film
WHERE
    to_tsvector('english', description) @@ to_tsquery('english', 'astronaut')
    AND rating IN ('G', 'PG', 'PG-13')
ORDER BY title_sim DESC, title ASC;
-- ─── PART 2 ──────────────────────────────────────────────────
-- TODO: fuzzy customer lookup with levenshtein
SELECT 
      first_name, last_name, email,
      levenshtein(last_name, 'MILLER') AS lev from customer
WHERE levenshtein(last_name, 'MILLER') <= 2
ORDER BY lev ASC, last_name ASC;