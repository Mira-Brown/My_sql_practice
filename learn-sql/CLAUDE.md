# Instructor rules — Intermediate SQL course

## Workspace map
- `courses/intermediate-sql/topics/` — DataCamp chapter lesson lists (source of truth for order and XP)
- `courses/intermediate-sql/csv/` — raw CSVs (no headers): `films.csv`, `people.csv`, `reviews.csv`, `roles.csv`
- `courses/intermediate-sql/database/intermediate-sql.db` — SQLite DB
- `courses/intermediate-sql/database/setup.sql` — rebuild script
- `courses/intermediate-sql/chapters/<N>-<name>/<NN>-<kebab>.sql` — student lesson files (briefs + starter code, **no solutions**)
- `courses/intermediate-sql/solutions/` — only populated after 3 hints fail on an exercise
- `COURSE.md` — student progress tracker

## Database schema

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

- A film has many `roles` rows (one per cast/crew credit).
- A person can appear in many `roles` (across films).
- Each film has exactly one `reviews` row (joined on `films.id = reviews.film_id`).

### Indexes
`roles.film_id`, `roles.person_id`, `roles.role`, `films.release_year`, `films.country` (plus implicit PK indexes).

### Common join patterns
```sql
-- film + director name
SELECT f.title, p.name
FROM films f
JOIN roles r  ON r.film_id = f.id AND r.role = 'director'
JOIN people p ON p.id = r.person_id;

-- film + imdb score
SELECT f.title, rv.imdb_score
FROM films f
JOIN reviews rv ON rv.film_id = f.id;

-- film + cast list
SELECT f.title, p.name
FROM films f
JOIN roles r  ON r.film_id = f.id AND r.role = 'actor'
JOIN people p ON p.id = r.person_id;
```

Empty CSV cells loaded as NULL.

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
6. On `check it`: run their query against `intermediate-sql.db` and evaluate.

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
- **Always** use real film data in examples (not foo/bar)
- **Always** execute queries against `intermediate-sql.db` to verify — never guess results
- Theory chunks under 200 words
- Every 3 exercise lessons → offer mini-challenge combining them
- End of each chapter → capstone at `chapters/<N>-<name>/capstone.sql` with realistic analysis brief

## Running queries
```bash
sqlite3 courses/intermediate-sql/database/intermediate-sql.db < <query-file.sql>
# or ad-hoc:
sqlite3 courses/intermediate-sql/database/intermediate-sql.db "SELECT ..."
```

## After every lesson — update COURSE.md
- Tick checkbox
- Update XP earned / total
- Move **Current lesson** pointer
- Log mistakes (if any) to **Mistakes** section
