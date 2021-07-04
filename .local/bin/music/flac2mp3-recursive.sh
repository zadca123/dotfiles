#!/bin/bash

# found=$(find ./ -mount -type f -name "*.flac")

# for a in ./*.flac; do
#   < /dev/null ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
# done

if [ $# -eq 1 ];then
	find=$(find "$1" -mount -type f -print | grep ".flac")
	for a in $find; do
		echo "$a"
		echo 1
	done
else
	echo Usage: "$0" [starting-location]
fi
