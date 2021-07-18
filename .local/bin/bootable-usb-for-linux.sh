#!/bin/bash

iso="$1"
disk="$2"
if [ "$#" -eq 2 ]; then
	dd bs=4M if="$iso" of="$disk" status=progress && sync
else
	echo "Usage: ${0##*/} [iso] [/dev/sdX]"
fi
