#!/usr/bin/env bash
# Build the PostgreSQL Sakila database for the
# "Functions for Manipulating Data in PostgreSQL" course.
#
# Requires:
#   • a running local PostgreSQL server with psql + createdb on PATH
#     (macOS/Homebrew:  brew install postgresql@16 && brew services start postgresql@16)
#   • SUPERUSER privileges — the schema loads data via COPY ... FROM PROGRAM 'curl ...'
#   • outbound internet + `curl` on the DB host (data is fetched from DataCamp)
#
# Override the DB name with:  DB_NAME=my_db ./setup.sh
set -euo pipefail

DB_NAME="${DB_NAME:-sakila}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Recreating database '$DB_NAME'…"
dropdb --if-exists "$DB_NAME"
createdb "$DB_NAME"

# Run from this dir so the \i (schema) path resolves.
cd "$DIR"
echo "→ Loading types, schema, data (curl from DataCamp), extensions…"
psql -v ON_ERROR_STOP=1 -d "$DB_NAME" -f setup.sql

echo "✅ Database '$DB_NAME' ready."
echo "   Connect:  psql -d $DB_NAME"
