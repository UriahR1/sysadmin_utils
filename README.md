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

