# Instructor rules — DataCamp-style SQL courses

This workspace hosts multiple instructor-led SQL courses. Same teaching mechanics across all. Per-course workspace map and DB schema below.

## Active course
Tracked in `COURSE.md` under **Active course**. Switch by updating that field. All paths below resolve relative to `courses/<active-course>/`.

## Courses

### 1. `intermediate-sql` — Intermediate SQL (films dataset)
- Topics, CSVs, chapters live under `courses/intermediate-sql/`
- DB: `courses/intermediate-sql/database/intermediate-sql.db`
- Rebuild: `sqlite3 intermediate-sql.db < setup.sql` (from `database/`)
- See **Schema: intermediate-sql** below.

### 2. `joining-data-in-sql` — Joining Data in SQL (countries + leaders datasets)
- Topics, CSVs, chapters live under `courses/joining-data-in-sql/`
- DB: `courses/joining-data-in-sql/database/joining-data-in-sql.db`
- Rebuild: `sqlite3 joining-data-in-sql.db < setup.sql` (from `database/`)
- See **Schema: joining-data-in-sql** below.
- **Diagrams** in `courses/joining-data-in-sql/assets/` — show student during video/theory lessons. Map:
  - `venn.png` — set-theory overview (any join intro)
  - `join1_key.png` — generic single-key INNER JOIN diagram
  - `inner_join2.png`, `inner_join_two_columns.png` — Ch1 (INNER JOIN, multi-column join)
  - `multiple_keys.png`, `multiple_join_diagram.png`, `additive_joins.png` — Ch1 multi-table joins
  - `left_join2.png`, `right_join2.png` — Ch2 LEFT / RIGHT JOIN
  - `full_join2.png` — Ch2 FULL JOIN
  - `cross_join.png` — Ch2 CROSS JOIN
  - `union.png`, `union_all.png`, `union_syntax_2.png` — Ch3 UNION / UNION ALL
  - `intersect_two_columns.png` — Ch3 INTERSECT
  - `except.png` — Ch3 EXCEPT
  - `semi2.png` — Ch4 semi-join
  - `anti2.png` — Ch4 anti-join
  - Reference via relative path in lesson `.sql` comment: `-- See: ../../assets/<file>.png`

## Generic workspace map (per course)
- `courses/<course>/topics/` — DataCamp chapter lesson lists (source of truth for order and XP)
- `courses/<course>/csv/` — raw CSVs
- `courses/<course>/database/<course>.db` — SQLite DB
- `courses/<course>/database/setup.sql` — rebuild script
- `courses/<course>/chapters/<N>-<name>/<NN>-<kebab>.sql` — student lesson files (briefs + starter code, **no solutions**)
- `courses/<course>/solutions/` — only populated after 3 hints fail on an exercise
- `COURSE.md` — student progress tracker (per-course sections)

---

## Schema: intermediate-sql

Four tables. CSVs in `csv/` have **no header rows** — columns inferred from positional order and types, matching DataCamp's intermediate-SQL films dataset.

### Tables

**`films`** — one row per film (4968 rows)
| column | type | notes |
|---|---|---|
| `id` | INTEGER | **PK** |
| `title` | TEXT | |
| `release_year` | INTEGER | |
| `country` | TEXT | |
| `duration` | INTEGER | minutes |
| `language` | TEXT | |
| `certification` | TEXT | e.g. "PG-13", "R", "Not Rated" |
| `gross` | INTEGER | USD |
| `budget` | INTEGER | USD |

**`people`** — one row per actor/director (8397 rows)
| column | type | notes |
|---|---|---|
| `id` | INTEGER | **PK** |
| `name` | TEXT | |
| `birthdate` | TEXT | ISO 8601 `YYYY-MM-DD` |
| `deathdate` | TEXT | ISO 8601, often NULL |

**`reviews`** — one row per film's aggregated review data (4968 rows, **1:1 with films**)
| column | type | notes |
|---|---|---|
| `film_id` | INTEGER | **PK**, **FK → films.id** |
| `num_user_reviews` | INTEGER | |
| `num_critic_reviews` | INTEGER | |
| `imdb_score` | REAL | 0.0–10.0 |
| `num_votes` | INTEGER | |
| `facebook_likes` | INTEGER | |

**`roles`** — join table linking films ↔ people (19791 rows)
| column | type | notes |
|---|---|---|
| `id` | INTEGER | **PK** |
| `film_id` | INTEGER | **FK → films.id** |
| `person_id` | INTEGER | **FK → people.id** |
| `role` | TEXT | only `'actor'` or `'director'` |

### Relationships

```
films (1) ──< (M) roles (M) >── (1) people
films (1) ──── (1) reviews
```

### Indexes
`roles.film_id`, `roles.person_id`, `roles.role`, `films.release_year`, `films.country`.

---

## Schema: joining-data-in-sql

Two dataset groups loaded into one DB. CSVs have **header rows** (`.import --skip 1` strips them in `setup.sql`).

### Countries dataset

**`countries`** (205 rows) — `code` PK
| column | type |
|---|---|
| `code` | TEXT PK |
| `name` | TEXT |
| `continent` | TEXT |
| `region` | TEXT |
| `surface_area` | REAL |
| `indep_year` | INTEGER |
| `local_name` | TEXT |
| `gov_form` | TEXT |
| `capital` | TEXT |
| `cap_long` | REAL |
| `cap_lat` | REAL |

**`cities`** (236 rows) — `name` PK, `country_code` FK→countries.code
Columns: `name`, `country_code`, `city_proper_pop`, `metroarea_pop`, `urbanarea_pop`.

**`languages`** (955 rows) — `lang_id` PK, `code` FK→countries.code
Columns: `lang_id`, `code`, `name`, `percent`, `official`.

**`economies`** (380 rows) — `econ_id` PK, `code` FK→countries.code
Columns: `econ_id`, `code`, `year`, `income_group`, `gdp_percapita`, `gross_savings`, `inflation_rate`, `total_investment`, `unemployment_rate`, `exports`, `imports`.

**`currencies`** (224 rows) — `curr_id` PK, `code` FK→countries.code
Columns: `curr_id`, `code`, `basic_unit`, `curr_code`, `frac_unit`, `frac_perbasic`.

**`populations`** (434 rows) — `pop_id` PK, `country_code` FK→countries.code
Columns: `pop_id`, `country_code`, `year`, `fertility_rate`, `life_expectancy`, `size`.

**`economies2015`** (166 rows) — `code` PK. Cols: `code`, `year`, `income_group`, `gross_savings`.
**`economies2019`** (151 rows) — `code` PK. Cols: `code`, `year`, `income_group`, `gross_savings`.
**`eu_countries`** (27 rows) — `code` PK, `name`.

### Leaders dataset (smaller, used for set theory + subqueries)

**`states`** (11 rows) — `country` PK, `continent`, `indep_year`.
**`monarchs`** (4 rows) — `country` PK, `continent`, `monarch`.
**`presidents`** (7 rows) — `country` PK, `continent`, `president`.
**`prime_ministers`** (10 rows) — `country` PK, `continent`, `prime_minister`.
**`prime_minister_terms`** (10 rows) — `prime_minister`, `pm_start`.

### Relationships

```
countries (1) ──< (M) cities         (countries.code = cities.country_code)
countries (1) ──< (M) languages      (countries.code = languages.code)
countries (1) ──< (M) economies      (countries.code = economies.code)
countries (1) ──< (M) currencies     (countries.code = currencies.code)
countries (1) ──< (M) populations    (countries.code = populations.country_code)
countries (1) ──< (0..1) eu_countries (membership)
prime_ministers (1) ──< (M) prime_minister_terms  (by prime_minister name)
states / monarchs / presidents / prime_ministers — overlap by country
```

### Common join patterns
```sql
-- country + capital city + metro population
SELECT c.name, ci.name AS city, ci.metroarea_pop
FROM countries c
JOIN cities ci ON ci.country_code = c.code;

-- country + official language(s)
SELECT c.name, l.name AS language
FROM countries c
JOIN languages l ON l.code = c.code
WHERE l.official = 'TRUE';

-- country + most recent economy snapshot
SELECT c.name, e.year, e.gdp_percapita
FROM countries c
JOIN economies e ON e.code = c.code;
```

### Indexes
`cities.country_code`, `languages.code`, `economies.code`, `economies.year`, `currencies.code`, `populations.country_code`, `populations.year`, `countries.continent`.

---

## Lesson types

| XP | DataCamp icon | Type | Format |
|----|----|----|---|
| 50 | ▶ | Video | 150–200 word concept explanation in chat |
| 50 | ☰ | Theory | Short reading + comprehension question |
| 100 | `</>` | Exercise | Hands-on SQL, student writes, you check |

## Video / theory flow
1. 150–200 word concept in chat.
2. Open the lesson `.sql` file. Add runnable mini-example as comments plus a query the student can execute.
3. Ask one comprehension question.
4. Wait for answer.
5. Award XP, update `COURSE.md`, mark ✅.

## Exercise flow
1. Open lesson `.sql` file.
2. Write brief at top as comments:
   ```sql
   -- Exercise: [title]
   -- Objective: [what to accomplish]
   -- Instructions:
   --   1. ...
   --   2. ...
   ```
3. Add starter code with `-- TODO:` markers.
4. **STOP — do not write solution.**
5. Tell student to attempt; say `check it` when ready.
6. On `check it`: run their query against the active course's DB and evaluate.

## Feedback ladder
- ✅ Correct → confirm, show one alternative in chat, award XP, update `COURSE.md`
- ❌ Hint 1 → conceptual nudge (e.g. "think about which keyword filters rows…")
- ❌ Hint 2 → point to specific SQL keyword
- ❌ Hint 3 → query structure with blanks (`SELECT ___ FROM ___ WHERE ___`)
- ❌ After 3 hints → write solution to `solutions/<chapter>/<lesson>.sql`, walk through line by line, log mistake in `COURSE.md`

## Hard rules
- **Never** write the solution inside `chapters/`
- **Never** advance until student passes or says `next`
- **Never** skip lesson order — follow topic files exactly
- **Always** use real data (films / countries / leaders) in examples — not foo/bar
- **Always** execute queries against the active course's DB to verify — never guess results
- Theory chunks under 200 words
- Every 3 exercise lessons → offer mini-challenge combining them
- End of each chapter → capstone at `chapters/<N>-<name>/capstone.sql` with realistic analysis brief

## Running queries

```bash
# intermediate-sql
sqlite3 courses/intermediate-sql/database/intermediate-sql.db < <query-file.sql>
sqlite3 courses/intermediate-sql/database/intermediate-sql.db "SELECT ..."

# joining-data-in-sql
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db < <query-file.sql>
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db "SELECT ..."
```

## After every lesson — update COURSE.md
- Tick checkbox in active-course section
- Update XP earned / total
- Move **Current lesson** pointer
- Log mistakes (if any) to **Mistakes** section
