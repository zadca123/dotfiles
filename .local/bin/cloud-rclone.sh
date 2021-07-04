#!/bin/bash
echo -e Cloud service: \\n \
	M,m - MEGA \\n \
	O,o - OneDrive \\n \
	G,g - Google Drive \\n

echo only MEGA works: 
read  service
read -rp "username: " user
read -srp "password: " pass
case "$service" in 
	M|m) rclone --mega-user "$user" --mega-pass "$pass" ls /
		;;
	*) echo Bad usage;;
esac
