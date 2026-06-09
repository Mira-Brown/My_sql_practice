# SQL courses — Student Guide

DataCamp-style, instructor-led SQL courses you take through Claude Code. Each course runs against a local SQLite database. No internet, no signups.

Three courses currently available:

| # | Course | Lessons | XP | Dataset | Status |
|---|---|---|---|---|---|
| 1 | Intermediate SQL | 49 | 3900 | ~5000 films | ✅ complete |
| 2 | Joining Data in SQL | 47 | 3950 | countries + leaders | ✅ complete |
| 3 | Data Manipulation in SQL | 55 | 4700 | European Soccer | 🟢 ready |

---

## 1. What you need

- **SQLite 3** installed (`sqlite3 --version` — ships with macOS)
- **Claude Code** in this workspace
- An editor to view/edit lesson `.sql` files

---

## 2. Workspace layout

```
learn-sql/
├── README.md                              ← you are here
├── CLAUDE.md                              ← rules the instructor follows
├── COURSE.md                              ← your progress tracker (all courses)
└── courses/
    ├── intermediate-sql/
    │   ├── topics/                        ← raw chapter spec
    │   ├── csv/                           ← raw data
    │   ├── database/
    │   │   ├── intermediate-sql.db
    │   │   └── setup.sql
    │   ├── chapters/                      ← lesson files
    │   └── solutions/                     ← filled if you fail 3 hints
    ├── joining-data-in-sql/
    │   ├── topics/
    │   ├── csv/                           (countries/, leaders/)
    │   ├── assets/                        (join diagrams — Venn, INNER/LEFT/RIGHT/FULL/CROSS, UNION, INTERSECT, EXCEPT, semi/anti)
    │   ├── database/
    │   │   ├── joining-data-in-sql.db
    │   │   └── setup.sql
    │   ├── chapters/
    │   └── solutions/
    └── data-manipulation-in-sql/
        ├── topics/
        ├── csv/                           (country, league, team, match)
        ├── database/
        │   ├── data-manipulation-in-sql.db
        │   └── setup.sql
        ├── chapters/
        └── solutions/
```

---

## 3. Picking a course

Open `COURSE.md` — first line shows **Active course**. Edit it to switch between `intermediate-sql`, `joining-data-in-sql`, and `data-manipulation-in-sql`, or tell the instructor "switch to data-manipulation-in-sql".

---

## 4. How to start a session

In Claude Code, say:

```
begin teaching
```

The instructor:
1. Reads **Active course** from `COURSE.md`.
2. Opens the **current lesson** file for that course.
3. Teaches it. Waits for your input.

To pick up later, say `begin teaching` again — `COURSE.md` remembers where you stopped per course.

---

## 5. The 3 lesson types

| Icon | XP | Type | What happens |
|---|---|---|---|
| ▶ | 50 | **Video** | Instructor explains concept in chat (150–200 words), drops a runnable example in the lesson file, asks one comprehension question |
| ☰ | 50 | **Theory** | Short reading + comprehension question |
| `</>` | 100 | **Exercise** | You write the SQL yourself, instructor checks |

---

## 6. Doing a Video or Theory lesson

1. Instructor explains in chat.
2. Open the lesson file (e.g. `chapters/1-introducing-inner-joins/01-the-ins-and-outs-of-inner-join.sql`).
3. Read / run the example.
4. Answer the comprehension question.
5. XP awarded, `COURSE.md` updated.

---

## 7. Doing an Exercise lesson

1. Instructor writes brief at top of lesson file (comments) + starter code with `-- TODO:` markers.
2. You fill in the TODOs. Save.
3. Type `check it` in chat.
4. Instructor runs your query against the active DB and grades.

### Stuck?

- `hint` — conceptual nudge
- `hint 2` — names the missing SQL keyword
- `hint 3` — query skeleton with blanks
- After 3 hints fail → instructor writes solution to `solutions/<chapter>/<lesson>.sql`, walks through it, logs the mistake in `COURSE.md`.

---

## 8. Useful chat commands

| Say | Meaning |
|---|---|
| `begin teaching` | Start or resume the active course |
| `switch to <course>` | Change active course |
| `check it` | Submit your exercise |
| `hint`, `hint 2`, `hint 3` | Progressively stronger hints |
| `next` | Skip current lesson (0 XP) |
| `redo` | Re-attempt current lesson |
| `where am I` | Show current lesson + XP total |

---

## 9. Running queries yourself

```bash
# Intermediate SQL
sqlite3 courses/intermediate-sql/database/intermediate-sql.db
sqlite3 courses/intermediate-sql/database/intermediate-sql.db < path/to/file.sql
sqlite3 courses/intermediate-sql/database/intermediate-sql.db "SELECT COUNT(*) FROM films;"

# Joining Data in SQL
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db < path/to/file.sql
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db "SELECT COUNT(*) FROM countries;"

# Data Manipulation in SQL
sqlite3 courses/data-manipulation-in-sql/database/data-manipulation-in-sql.db
sqlite3 courses/data-manipulation-in-sql/database/data-manipulation-in-sql.db < path/to/file.sql
sqlite3 courses/data-manipulation-in-sql/database/data-manipulation-in-sql.db "SELECT COUNT(*) FROM match;"
```

Inside the shell:
```
.tables
.schema countries
.headers on
.mode column
SELECT * FROM countries LIMIT 5;
.quit
```

---

## 10. The databases

### `intermediate-sql.db` — films
```
films (4968)   ─< roles (19791) >─  people (8397)
   │
   └────  reviews (4968, 1:1 by film_id)
```
- **films** — `id`, `title`, `release_year`, `country`, `duration`, `language`, `certification`, `gross`, `budget`
- **people** — `id`, `name`, `birthdate`, `deathdate`
- **reviews** — `film_id`, `num_user_reviews`, `num_critic_reviews`, `imdb_score`, `num_votes`, `facebook_likes`
- **roles** — `id`, `film_id`, `person_id`, `role` (`'actor'` / `'director'`)

### `joining-data-in-sql.db` — countries + leaders
**Countries dataset** (joined on `countries.code`):
- **countries** (205) — `code` PK, `name`, `continent`, `region`, `surface_area`, `indep_year`, `local_name`, `gov_form`, `capital`, `cap_long`, `cap_lat`
- **cities** (236) — `name` PK, `country_code` FK, `city_proper_pop`, `metroarea_pop`, `urbanarea_pop`
- **languages** (955) — `lang_id` PK, `code` FK, `name`, `percent`, `official`
- **economies** (380) — `econ_id` PK, `code` FK, `year`, `income_group`, `gdp_percapita`, `gross_savings`, `inflation_rate`, `total_investment`, `unemployment_rate`, `exports`, `imports`
- **currencies** (224) — `curr_id` PK, `code` FK, `basic_unit`, `curr_code`, `frac_unit`, `frac_perbasic`
- **populations** (434) — `pop_id` PK, `country_code` FK, `year`, `fertility_rate`, `life_expectancy`, `size`
- **economies2015** (166) / **economies2019** (151) — `code` PK, `year`, `income_group`, `gross_savings`
- **eu_countries** (27) — `code` PK, `name`

**Leaders dataset** (used in set theory + subquery chapters):
- **states** (11) — `country` PK, `continent`, `indep_year`
- **monarchs** (4) — `country` PK, `continent`, `monarch`
- **presidents** (7) — `country` PK, `continent`, `president`
- **prime_ministers** (10) — `country` PK, `continent`, `prime_minister`
- **prime_minister_terms** (10) — `prime_minister`, `pm_start`

### `data-manipulation-in-sql.db` — European Soccer
```
country (11) ─< league (11)
country (11) ─< match (12837) >─ team (299)   (match.hometeam_id / awayteam_id = team.team_api_id)
```
- **country** (11) — `id` PK, `name`
- **league** (11) — `id` PK, `country_id` FK→country.id, `name`
- **team** (299) — `id` PK, `team_api_id` (joined by match), `team_long_name`, `team_short_name`
- **match** (12837) — `id` PK, `country_id` FK→country.id, `season`, `stage`, `date`, `hometeam_id`, `awayteam_id` (→team.team_api_id), `home_goal`, `away_goal`

### Rebuilding a DB

```bash
# intermediate-sql
cd courses/intermediate-sql/database
rm -f intermediate-sql.db
sqlite3 intermediate-sql.db < setup.sql

# joining-data-in-sql
cd courses/joining-data-in-sql/database
rm -f joining-data-in-sql.db
sqlite3 joining-data-in-sql.db < setup.sql

# data-manipulation-in-sql
cd courses/data-manipulation-in-sql/database
rm -f data-manipulation-in-sql.db
sqlite3 data-manipulation-in-sql.db < setup.sql
```

Row-count summary prints after each rebuild — verify all tables loaded.

---

## 11. Course outlines

### Intermediate SQL (49 lessons, 3900 XP)
| Ch | Title | Lessons | XP |
|---|---|---|---|
| 1 | Selecting records | 11 | 850 |
| 2 | Filtering records | 15 | 1200 |
| 3 | Aggregate functions | 11 | 900 |
| 4 | Sorting and grouping | 12 | 950 |

### Joining Data in SQL (47 lessons, 3950 XP)
| Ch | Title | Lessons | XP |
|---|---|---|---|
| 1 | Introducing Inner Joins | 10 | 850 |
| 2 | Outer Joins, Cross Joins and Self Joins | 14 | 1200 |
| 3 | Set Theory for SQL Joins | 10 | 800 |
| 4 | Subqueries | 13 | 1100 |

### Data Manipulation in SQL (55 lessons, 4700 XP)
| Ch | Title | Lessons | XP |
|---|---|---|---|
| 1 | We Take the CASE | 11 | 950 |
| 2 | Short and Simple Subqueries | 14 | 1200 |
| 3 | Correlated Queries, Nested Queries, and CTEs | 15 | 1250 |
| 4 | Window Functions | 15 | 1300 |

Each chapter ends with a **capstone** (`chapters/<N>-<name>/capstone.sql`) — a realistic analysis brief combining everything in that chapter.

---

## 12. Progress tracking

Open `COURSE.md` any time. Per course: lesson checklist, XP earned vs. total, current lesson pointer, mistakes log. Instructor updates after every lesson — don't hand-edit mid-session.

---

## 13. Tips

- **Don't peek at `solutions/`** until you've burned 3 hints.
- **Run queries often** — SQL is a feedback-loop language.
- **Real data is messy.** NULLs, weird capitalization, duplicates. Embrace.
- **Type-check yourself.** Run your query before saying `check it`.
- **Style matters.** Keywords UPPERCASE, identifiers lowercase, one clause per line.

Good luck. Start with `begin teaching`.

## Start SQL shells
```bash
sqlite3 courses/intermediate-sql/database/intermediate-sql.db
sqlite3 courses/joining-data-in-sql/database/joining-data-in-sql.db
sqlite3 courses/data-manipulation-in-sql/database/data-manipulation-in-sql.db
```
