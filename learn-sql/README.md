# Intermediate SQL — Student Guide

A DataCamp-style, instructor-led SQL course you take through Claude Code. 4 chapters, 49 lessons, 3900 XP total, all run against a local SQLite database of ~5000 real films.

---

## 1. What you need

- **SQLite 3** installed (`sqlite3 --version` to check; ships with macOS)
- **Claude Code** running in this workspace
- A code editor (VS Code, Cursor, etc.) to edit lesson `.sql` files

That's it. No internet, no signups, no paid tools.

---

## 2. Workspace layout

```
learn-sql/
├── README.md                              ← you are here
├── CLAUDE.md                              ← rules the instructor follows
├── COURSE.md                              ← your progress tracker
└── courses/intermediate-sql/
    ├── topics/                            ← raw chapter spec (don't edit)
    ├── csv/                               ← raw data (don't edit)
    ├── database/
    │   ├── intermediate-sql.db            ← the database you query
    │   └── setup.sql                      ← rebuild script
    ├── chapters/                          ← YOUR lesson files live here
    │   ├── 1-selecting-records/
    │   ├── 2-filtering-records/
    │   ├── 3-aggregate-functions/
    │   └── 4-sorting-and-grouping/
    └── solutions/                         ← only filled if you fail 3 hints
```

---

## 3. How to start a session

In Claude Code, say:

```
begin teaching
```

The instructor will:
1. Open the **current lesson** file (tracked in `COURSE.md`).
2. Teach it (one of 3 formats below).
3. Wait for your input before moving on.

To pick up later, just say `begin teaching` again — `COURSE.md` remembers where you stopped.

---

## 4. The 3 lesson types

DataCamp uses three lesson formats. Same here.

| Icon | XP | Type | What happens |
|---|---|---|---|
| ▶ | 50 | **Video** | Instructor writes 150–200 word concept explanation in chat, drops a runnable example in the lesson file, asks one comprehension question |
| ☰ | 50 | **Theory** | Short reading + comprehension question |
| `</>` | 100 | **Exercise** | You write the SQL yourself, instructor checks |

---

## 5. Doing a Video or Theory lesson

1. Instructor explains the concept in chat.
2. Open the lesson file (e.g. `chapters/1-selecting-records/01-querying-a-database.sql`).
3. Read the example. Run it if you want:
   ```bash
   sqlite3 courses/intermediate-sql/database/intermediate-sql.db < courses/intermediate-sql/chapters/1-selecting-records/01-querying-a-database.sql
   ```
4. Answer the comprehension question in chat.
5. XP awarded, `COURSE.md` updated, ✅ ticked.

---

## 6. Doing an Exercise lesson

1. Instructor writes a brief at the top of the lesson file as comments, plus starter code with `-- TODO:` markers.
2. **Your job:** fill in the TODOs. Save the file.
3. When ready, type in chat:
   ```
   check it
   ```
4. Instructor runs your query against `intermediate-sql.db` and grades it.

### If you get stuck

Type any of these in chat:

- `hint` — instructor gives a conceptual nudge (e.g. "think about which keyword filters rows")
- `hint 2` — instructor names the specific SQL keyword you're missing
- `hint 3` — instructor shows query structure with blanks: `SELECT ___ FROM ___ WHERE ___`
- After 3 hints fail, the instructor writes the answer to `solutions/<chapter>/<lesson>.sql` and walks you through it line by line. The mistake is logged in `COURSE.md` so you can review later.

### If you nail it

- ✅ confirmation in chat
- One alternative approach shown (different syntax, different angle)
- XP awarded
- `COURSE.md` updated
- Next lesson loaded

---

## 7. Useful chat commands

| Say | Meaning |
|---|---|
| `begin teaching` | Start or resume the course |
| `check it` | Submit your exercise for grading |
| `hint`, `hint 2`, `hint 3` | Get progressively stronger hints |
| `next` | Skip to next lesson (your XP for this one stays at 0) |
| `redo` | Re-attempt the current lesson |
| `where am I` | Show current lesson + XP total |

---

## 8. Running queries yourself

Open a terminal in this workspace.

**Interactive shell:**
```bash
sqlite3 courses/intermediate-sql/database/intermediate-sql.db
```
Inside the shell:
```
.tables           -- list tables
.schema films     -- show CREATE for one table
.headers on
.mode column
SELECT * FROM films LIMIT 5;
.quit
```

**Run a `.sql` file:**
```bash
sqlite3 courses/intermediate-sql/database/intermediate-sql.db < path/to/file.sql
```

**One-off query:**
```bash
sqlite3 courses/intermediate-sql/database/intermediate-sql.db "SELECT COUNT(*) FROM films;"
```

---

## 9. The database

One file: `courses/intermediate-sql/database/intermediate-sql.db`. Four tables.

```
films (4968)   ─< roles (19791) >─  people (8397)
   │
   └────  reviews (4968, 1:1 by film_id)
```

- **`films`** — `id`, `title`, `release_year`, `country`, `duration`, `language`, `certification`, `gross`, `budget`
- **`people`** — `id`, `name`, `birthdate`, `deathdate`
- **`reviews`** — `film_id`, `num_user_reviews`, `num_critic_reviews`, `imdb_score`, `num_votes`, `facebook_likes`
- **`roles`** — `id`, `film_id`, `person_id`, `role` (`'actor'` or `'director'` only)

Empty CSV cells loaded as `NULL`. Get used to filtering `WHERE col IS NOT NULL` — chapter 2 covers it.

### If you break the database

Rebuild from scratch:
```bash
cd courses/intermediate-sql/database
rm -f intermediate-sql.db
sqlite3 intermediate-sql.db < setup.sql
```

You'll see row counts confirming all 4 tables loaded.

---

## 10. Progress tracking

Open `COURSE.md` any time. It shows:

- A checklist of all 49 lessons across 4 chapters
- XP earned vs. total (e.g. `XP earned: 350 / 3900`)
- Current lesson pointer
- Mistakes log — every exercise where you needed all 3 hints, with the lesson and what tripped you up

The instructor updates this **after every lesson**. Don't edit it by hand mid-session — let the instructor manage it.

---

## 11. Course outline

| Ch | Title | Lessons | XP |
|---|---|---|---|
| 1 | Selecting records | 11 | 850 |
| 2 | Filtering records | 15 | 1200 |
| 3 | Aggregate functions | 11 | 900 |
| 4 | Sorting and grouping | 12 | 950 |
| | **Total** | **49** | **3900** |

Each chapter ends with a **capstone** project (`capstone.sql`) — a realistic analysis brief combining everything from that chapter. Every 3 exercise lessons, you may get a mini-challenge that combines them.

---

## 12. Tips

- **Don't peek at `solutions/`** unless you've already exhausted 3 hints. Robs the learning.
- **Run queries often** — SQL is a feedback-loop language. Tiny tweaks, re-run, see what changes.
- **Real data is messy.** NULLs, weird capitalization, duplicate names. Embrace it; chapters 2 and 4 are partly about exactly this.
- **Type-check yourself.** Before saying `check it`, run the query yourself. If it errors, fix the error first.
- **Style matters from chapter 1.** Keywords in UPPERCASE, identifiers in lowercase, one clause per line. The instructor will nudge you on this.

Good luck. Start with `begin teaching`.

## Start SQL Shell
sqlite3 courses/intermediate-sql/database/intermediate-sql.db