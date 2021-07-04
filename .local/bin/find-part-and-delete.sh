#!/bin/bash

if [ $# -eq 1 ];then
	find "$1" -mount -type f -name "*.part" -exec trash-put "{}" \;
    find "$1" -type d -empty -print0 | xargs -0 -I {} /bin/rmdir "{}"

    # find "$1" -type f -empty -print0 | xargs -0 -I {} /bin/rm "{}" # delete empty files and directories
    # find "$1" -empty -print0 | xargs -0 -I {} trash-put "{}" # delete empty files and directories
	# find "$1" -mount -type d -empty -delete
else
	echo Usage: "$0" '[starting-location]'
fi


