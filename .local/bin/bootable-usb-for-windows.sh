#!/bin/bash

if [ "$#" -eq 2 ];then
	woeusb --target--filesystem NTFS --device "$1" "$2"
else
	echo Usage: "$0" [iso] [/dev/sdX]
fi
