#!/bin/bash

BACKUP=/mnt/crucial_nvme/Backup
create-backup-rsync-root.sh "$BACKUP" && create-backup-rsync-home.sh "$BACKUP"
