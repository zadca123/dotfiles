#!/bin/bash

[ "$#" -lt 2 ] && \
	echo Usage: "$0" '[format-to-convert] [file/s]' && \
	exit
for x in "${@:2}";do
	inkscape -D "$x" --export-type="$1"
done

# if [ "$#" -eq 2 ];then
# 	inkscape -D "$1" --export-type="$2" && \
# 	echo Success
# else
# 	echo Usage: "$0" '[file] [format-to-convert]'
# fi
