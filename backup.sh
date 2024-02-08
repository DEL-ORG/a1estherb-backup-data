#!/bin/bash

# PostgreSQL database credentials
DB_USER="$DB_USER"
DB_NAME="$DB_NAME"
HOST="$DB_HOST"
PORT="$DB_PORT" 
# Backup directory
BACKUP_DIR="/backup"
PGPASSWORD="$DB_PASSWORD"
# Timestamp (for filename)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup filename
BACKUP_FILE="$BACKUP_DIR/$DB_NAME_$TIMESTAMP.sql"

# Command to create backup
PGPASSWORD=$DB_PASSWORD pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME > $BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful. File: $BACKUP_FILE"
else
  echo "Backup failed."
fi

