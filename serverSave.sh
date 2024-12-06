#!/bin/bash

# Paths
SERVER_PATH=/home/tyler/Desktop/Fabric_Minecraft_Server
BACKUP_PATH=/home/tyler/Desktop/Minecraft_Backups

if [ ! -d "$BACKUP_PATH" ]; then
    mkdir "$BACKUP_PATH"
fi

# Date variables
DATE=$(date +%m-%d-%y)

echo "Stopping Minecraft server..."
python3 "$SERVER_PATH/serverStop.py"

echo "Copying world to backup folder..."
cp -r "$SERVER_PATH/world" "$BACKUP_PATH/world"

echo "Copy Successful..."

echo "Starting Server..."
cd "$SERVER_PATH" || exit
nohup bash serverStart.sh > /dev/null 2>&1 &

echo "Creating/Compressing backup..."
cd "$BACKUP_PATH" || exit

BASE_NAME="$DATE"
ARCHIVE_NAME="$BASE_NAME.7z"
COUNTER=2

# Check for existing archive and create a new one if necessary
while [ -f "$ARCHIVE_NAME" ]; do
    ARCHIVE_NAME="${BASE_NAME}_($COUNTER).7z"
    COUNTER=$((COUNTER + 1))
done

# Compress the backup
7z a -t7z "$ARCHIVE_NAME" "$BACKUP_PATH/world"

echo "Completed Backup Successfully..."

echo "Deleting world copy..."
rm -rf "$BACKUP_PATH/world"

# Delete old backups
echo "Deleting old backup"

DELETE_DATE=$(date -d "-1 week" +"%m-%d-%y")
echo $DELETE_DATE

find . -type f -name "$DELETE_DATE*" -print -delete