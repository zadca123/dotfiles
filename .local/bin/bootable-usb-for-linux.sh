#!/bin/bash

if [ "$#" -eq 2 ];then
	dd bs=4M if="$1" of="$2" status=progress && sync
else
	echo Usage: "$0" [iso] \[/dev/sdX]
fi
