#!/bin/bash

if [ $# -eq 3 ];then
	rsync --compress --archive --recursive --verbose --prune-empty-dirs \
		--include="*/" --include="*.$1" --exclude="*" "$2" "$3"
else
	echo Usage: "$0" [extension] [rsync-from] [rsync-to]
fi
