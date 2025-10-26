#!/bin/bash
# Create database file if it doesn't exist
# Check which path is being used
DB_PATH="${DB_DATABASE:-database/database.sqlite}"

# Extract directory from path
DB_DIR=$(dirname "$DB_PATH")

# Create directory if it doesn't exist
if [ "$DB_DIR" != "." ]; then
    mkdir -p "$DB_DIR"
fi

# Create database file if it doesn't exist
if [ ! -f "$DB_PATH" ]; then
    touch "$DB_PATH"
    echo "Created database file at $DB_PATH"
else
    echo "Database file already exists at $DB_PATH"
fi

