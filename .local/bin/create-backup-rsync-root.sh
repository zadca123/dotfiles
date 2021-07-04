#!/bin/bash

# BACKUP=/mnt/crucial_nvme/Backup
# sudo rsync -avhzAxmi --progress --delete --delete-excluded
sudo rsync --archive --verbose --human-readable --compress --acls --one-file-system \
	--prune-empty-dirs --itemize-changes --progress --delete --delete-excluded \
	--exclude='*cache*' --exclude='*lost-found*' --exclude='*steam*' --exclude='*log*' \
	--exclude='dev/' --exclude='proc/' --exclude='sys/' --exclude='tmp/' --exclude='run/' \
	--exclude='/mnt/' --exclude='/media/' --exclude='swapfile' \
	/ "$1"  2>&1 | tee /home/zadca123/rsync-output.txt

# sudo find /var/cache/ -type f -name "*nvidia*" -exec cp -n "{}" "$BACKUP" \;
# and if you want install package manually in pacman use
# pacman -U /path/to/package.tar.gz

# rsync include exclude pattern examples:
# "*"         means everything
# "dir1"      transfers empty directory [dir1]
# "dir*"      transfers empty directories like: "dir1", "dir2", "dir3", etc...
# "file*"     transfers files whose names start with [file]
# "dir**"     transfers every path that starts with [dir] like "dir1/file.txt", "dir2/bar/ffaa.html", etc...
# "dir***"    same as above
# "dir1/*"    does nothing
# "dir1/**"   does nothing
# "dir1/***"  transfers [dir1] directory and all its contents like "dir1/file.txt", "dir1/fooo.sh", "dir1/fold/baar.py", etc...
