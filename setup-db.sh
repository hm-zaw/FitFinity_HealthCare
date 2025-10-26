#!/bin/bash
# Create database file if it doesn't exist
if [ ! -f "database/database.sqlite" ]; then
    touch database/database.sqlite
    echo "Created database/database.sqlite"
fi

