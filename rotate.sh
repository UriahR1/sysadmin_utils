#!/usr/bin/env bash

set -euo pipefail

# Sourcing the config file to assign variables

source "$(dirname "$0")/config.env"

filecount=$(find "$BACKUP_DIR" -name "*.tar.gz" -type f | wc -l)

if [[ "$filecount" -gt "$MAX_BACKUPS" ]]; then
	
	oldest=$(ls -t "$BACKUP_DIR"/*.tar.gz | tail -n 1)
	oldest_timestamp=$(basename -s ".tar.gz" "$oldest")
	oldlog=$(find "$LOG_DIR" -name "*_$oldest_timestamp.log")         
	
	while true; do

	read -p "File $oldest and corresponding logfile to be removed, are you sure [Y/n] :" answer
	
	if [[ "$answer" =~ ^[Yy]$ ]]; then

	rm "$oldest"
	
	[[ -f "$oldlog" ]] && rm "$oldlog" 
	
	echo "Operation complete : File : $oldest and File : $oldlog removed"
	
	break
else
	
	echo "Cancelled..."
	
	break
	
	fi
done
	
	
fi

