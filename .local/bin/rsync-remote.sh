#!/bin/bash

echo -e How to sync? \\n \
	H,h - new files to host \\n \
	R,r - new files to remote \\n
read -rp "Type: " DEV
# read -rp "Remote adress?: (example: zadca123@192.168.1.23) " -i zadca123@192.168.1.23 rADR
read -rp "Remote adress?: (example: zadca123@192.168.1.23) " rADR
case $DEV in
R|r)
	read -rp "Host path: " hDIR
	read -rp "Remote path: " rDIR
	rsync -azhmiP --backup -e ssh \
	"$hDIR" \
	"$rADR":"$rDIR"
	;;
H|h)
	read -rp "Host path: " hDIR
	read -rp "Remote path: " rDIR
	rsync -azhmiP --backup -e ssh \
	"$rADR":"$rDIR" \
	"$hDIR"
	;;
*)
	echo Usage: "$0" [local-location] [remote-location]
	;;
esac

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
