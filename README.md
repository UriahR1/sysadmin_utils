# Sysadmin Tool

Basic sysadmin tool, useful for backups, rollbacks, and file rotation.

## Project Structure

```
sysadmin/
├── backup.sh        # the main script — run manually or via cron
├── rollback.sh      # restore from a chosen backup
├── rotate.sh        # prune old backups beyond a set limit
├── deployment.sh    # sets everything up on a new machine
├── config.env       # all user settings live here, not hardcoded
├── logs/            # directory for storing logs
├── backups/         # backup directory
└── README.md
```

## Overview

These scripts back up files to a specified directory and create a timestamped log file under `logs/`. Each log is named according to the time and date the backup was created, and stores information about the directories/files that were backed up.

`tar` creates a compressed tarball (`.tar.gz`) of the chosen directory and saves it to `backups/`. The rollback script can then extract and restore a chosen backup. Most scripts require user input to complete the selected admin task.

## Configuration

> **Before running any script**, edit `config.env.example` with your paths, then rename it to `config.env`.

`config.env` stores all the variables the scripts rely on — nothing is hardcoded. Getting this right first ensures all scripts can locate the correct source and destination paths.
         
         
