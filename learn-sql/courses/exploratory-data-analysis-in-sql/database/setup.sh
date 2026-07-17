#!/usr/bin/env bash
# Build the PostgreSQL database for the
# "Exploratory Data Analysis in SQL" course.
#
# Requires a running local PostgreSQL server with psql + createdb on PATH.
#   macOS (Homebrew):  brew install postgresql@16 && brew services start postgresql@16
#
# Data loads from the LOCAL csv/ files via \copy — no superuser or internet needed.
#
# Override the DB name with:  DB_NAME=my_db ./setup.sh
set -euo pipefail

DB_NAME="${DB_NAME:-eda}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Recreating database '$DB_NAME'…"
dropdb --if-exists "$DB_NAME"
createdb "$DB_NAME"

# Run from this dir so the \copy paths (../csv/*.csv) resolve.
cd "$DIR"
echo "→ Loading schema + data…"
psql -v ON_ERROR_STOP=1 -d "$DB_NAME" -f setup.sql

echo "✅ Database '$DB_NAME' ready."
echo "   Connect:  psql -d $DB_NAME"
