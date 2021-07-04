#!/bin/bash

if [ "$1" == "music" ];then
		dtach -A "/tmp/$1-dtach" "$(dvtm cava cover-refresh.sh cmus)"
	else
		dtach -A "/tmp/$1-dtach" "$1"
fi


# [ "$#" -gt 1 ] && dtach -a "/tmp/$1-dtach"

# case "$2" in 
# 	music)
# 		dtach -a "/tmp/$2-dtach" "$(dvtm cava cover-refresh.sh cmus)"
# 		;;
# 	*)
# 		dtach -a "/tmp/$2-dtach" "$(dvtm cava cover-refresh.sh cmus)"
# 		;;
# esac

