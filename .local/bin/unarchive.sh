#!/bin/bash

#dependencies: atool
for arc in "$@"; do
	aunpack "$arc"
done

# fail() {
# 	echo "Archiving failed."
# 	notify-send -u normal "Archiving failed."
# 	exit 2
# }
# display_help(){
# 	echo "Usage: ${0##*/} [archive/s]"
# 	exit 2
# }
# [[ $# -lt 1 ]] && display_help

# for arc in "$@";do
# 	ext=${arc%.*}
# 	case $ext in
# 		# zip)
# 		# 	zip -r9 "$arc".zip "$arc" || fail
# 		# 	$notify
# 		# 	;;
# 		# 7z)
# 		# 	7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "$arc".7z "$1" || fail # ultra
# 		# 	# 7z a -mx=9 "$arc".7z "$1" || fail # normal
# 		# 	$notify
# 		# 	;;
# 		tar)tar -xvf "$arc";;
# 		gz) tar -I gzip -xvf "$arc";;
# 		bz2)tar -I bzip2 -xvf "$arc";;
# 		lzma)tar -I lzma -xvf "$arc";;
# 		xz)tar -I xz -xvf "$arc";;
# 		zst)tar -I zstd -xvf "$arc";; # unzstd "$arc" or # zstd -d "$arc"
# 		lz) tar -I lz -xvf "$arc";;
# 		*)display_help;;
# 	esac
# done
