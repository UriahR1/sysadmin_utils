#!/usr/bin/env bash

set -euo pipefail


# Sourcing config.env relative to script's location
source "$(dirname "$0")/config.env"

# Setting variables
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
TARLOG="$LOG_DIR/tarlog_${TIMESTAMP}.log"


# Capturing directory or file to backup and checking file type

read -p "Enter the directory/file to back up (specify full path) :" backup

	if [[ -f "$backup" ]]; then
		
		read -p "$backup file found, proceed with backup (Y/n) :" answer

	elif [[ -d "$backup" ]]; then
	
		read -p "$backup directory found, proceed with backup (Y/n) :" answer
	else
		echo "Error : $backup not found"
		exit 1
	fi

# Executing the backup using tar and sending output of tarball creation to logfile variable with timestamps

if [[ "$answer" =~ ^[Yy]$ ]]; then
	
	tar -cvzf "${BACKUP_DIR}/${TIMESTAMP}.tar.gz" "$backup" >> "$TARLOG" 2>&1
	
	echo "Source : $backup" >> "$TARLOG"	
		
		echo "Backup Complete. Exiting"

		else
		
			echo "Backup cancelled."
fi
