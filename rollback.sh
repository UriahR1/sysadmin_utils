#!/usr/bin/env bash


set -euo pipefail

# Sourcing config.env relative to file path

source "$(dirname "$0")/config.env"

# Storing last 5 files found in backup directory to rollback to be used as an array

mapfile -t rollback < <(find "$BACKUP_DIR" -name "*.tar.gz" | xargs ls -t | head -n 5)

# Testing for an empty backups diretory 

if [ "${#rollback[@]}" -lt 1 ]; then
	
	echo "Error, no backup found"

elif [ "${#rollback[@]}" -gt 0 ]; then
	
	while true; do
	
	read -p "Enter the file that you would like to roll back to (numerical input 1-5) : " num
	
	if [[ ! "$num" =~ ^[1-5]$ ]]; then
	
		echo "Error, invalid input"
	
	fi
	
	break
	
elif [[ "$num" =~ ^[1-5]$ ]]; then
	    
		echo "File number $num will be restored"
      	
		while true; do

	read -p "Enter the full path where you would like to restore :" restorepoint
	
	if [ ! -d "$restorepoint" ]; then
		
		echo "Error : could not find the path : $restorepoint

	elif [ -d "$restorepoint" ]; then

	for i in "${!rollback[@]}"; do
		echo "$((i+1)): $(basename "${rollback[$i]}")"