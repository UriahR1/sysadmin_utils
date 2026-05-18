# Basic sysadmin tool, useful for backups, rollbacks, and file rotation

sysadmin tree :

├── backup.sh          # the main script — run manually or via cron
├── rollback.sh        # restore from a chosen backup
├── rotate.sh          # prune old backups beyond a set limit
├── deployment.sh      # sets everything up on a new machine
├── config.env         # all user settings live here, not hardcoded
├── logs/              # directory for storing logs
├── backups/           # backup directory
└── README.md          

These scripts were created to backup files to a specified directory and create a log file
under the logs/ directory, with timestamps, these timestamps will be named in accordance
to the time and date that the backup was created. The logfile will store information on the
directories/files that were backed up. tar Will create a tarball and gunzip the chosen directory and back the directory up to the 
backups/ directory. rollback Script would then extract and roll back if chosen to run. Most of the
scripts requires user input in order to create the backup, rollback, or rotation of backups

**Note** config.env must be edited with your path(s) in order to store variables that the script will use
         in order to complete the admin tasks chosen. The config.env.example needs to be renamed to
         config.env after these paths have been edited
         
         
