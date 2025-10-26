#!/bin/bash
# Create database file if it doesn't exist

# If DB_DATABASE starts with /, treat it as absolute path, otherwise use current directory
if [ "${DB_DATABASE:0:1}" = "/" ]; then
    DB_PATH="$DB_DATABASE"
else
    DB_PATH="${DB_DATABASE:-database/database.sqlite}"
fi

# Extract directory from path
DB_DIR=$(dirname "$DB_PATH")

# Create directory if it doesn't exist
mkdir -p "$DB_DIR"

# Create database file if it doesn't exist
if [ ! -f "$DB_PATH" ]; then
    touch "$DB_PATH"
    echo "Created database file at $DB_PATH"
    ls -la "$DB_DIR" || echo "Directory listing failed"
else
    echo "Database file already exists at $DB_PATH"
fi

