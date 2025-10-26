#!/bin/bash
# Create database file if it doesn't exist
mkdir -p database
if [ ! -f "database/database.sqlite" ]; then
    touch database/database.sqlite
    echo "Created database/database.sqlite"
else
    echo "Database file already exists"
fi

