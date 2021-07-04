#!/bin/bash

# Script to backup personal files to the external USB drive.
# Specify the mount point here (DO NOT end mount_point with a forward-slash).
mount_point='/media/Buffalo_backup'

echo "#####"
echo ""
# Check whether target volume is mounted, and mount it if not.
if ! mountpoint -q ${mount_point}/; then
	echo "Mounting the external USB drive."
	echo "Mountpoint is ${mount_point}"
	if ! mount ${mount_point}; then
		echo "An error code was returned by mount command!"
		exit 5
	else echo "Mounted successfully.";
	fi
else echo "${mount_point} is already mounted.";
fi
# Target volume **must** be mounted by this point. If not, die screaming.
if ! mountpoint -q ${mount_point}/; then
	echo "Mounting failed! Cannot run backup without backup volume!"
	exit 1
fi

echo "Preparing to transfer differences using rsync."

# Use the year to create a new backup directory each year.
current_year=`date +%Y`
# Now construct the backup path, specifying the mount point followed by the path
# to our backup directory, finishing with the current year.
# (DO NOT end backup_path with a forward-slash.)
backup_path=${mount_point}'/rsync-backup/'${current_year}

echo "Backup storage directory path is ${backup_path}"

echo "Starting backup of /home/bob . . . "
# Create the target directory path if it does not already exist.
mkdir --parents ${backup_path}/home/bob/
# Use rsync to do the backup, and pipe output to tee command (so it gets saved
# to file AND output to screen).
# Note that the 2>&1 part simply instructs errors to be sent to standard output
# so that we see them in our output file.
sudo rsync --archive --verbose --human-readable --itemize-changes --progress \
--delete --delete-excluded \
--exclude='/.gvfs/' --exclude='/Examples/' --exclude='/.local/share/Trash/' \
--exclude='/.thumbnails/' --exclude='/transient-items/' \
/home/bob/ ${backup_path}/home/bob/ 2>&1 | tee /home/bob/rsync-output.txt

echo "Starting backup of /var/www . . . "
mkdir --parents ${backup_path}/var/www/
# This time use the -a flag with the tee command, so that it appends to the end
# of the rsync-output.txt file rather than start a new file from scratch.
sudo rsync --archive --verbose --human-readable --itemize-changes --progress \
--delete --delete-excluded \
--exclude='/.Trash-1000/' \
/var/www/ ${backup_path}/var/www/ 2>&1 | tee -a /home/bob/rsync-output.txt

# Ask user whether target volume should be unmounted.
echo -n "Do you want to unmount ${mount_point} (no)"
read -p ": " unmount_answer
unmount_answer=${unmount_answer,,}  # make lowercase
if [ "$unmount_answer" == "y" ] || [ "$unmount_answer" == "yes" ]; then
	if ! umount ${mount_point}; then
		echo "An error code was returned by umount command!"
		exit 5
	else echo "Dismounted successfully.";
	fi
else echo "Volume remains mounted.";
fi

echo ""
echo "####"
