#!/bin/sh

for x in "$@"; do
	aunpack "$x"
done


# notify=$(notify-send "Unarchiving Done")
# fail() {
#   notify-send -u low -i image "Archiving failed."
#   exit
# }
# # file="$@"
# unarchive(){
# 	case $2 in
# 	zst)
# 		unzstd "$1"
# 		# zstd -d "$1"
# 		# tar -I zstd -xvf archive.tar.zst
# 	# zip)
# 	# 	zip -r9 "$1".zip "$1" || fail
# 	# 	$notify
# 	# 	;;
# 	# 7z)
# 	# 	7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "$1".7z "$1" || fail # ultra
# 	# 	# 7z a -mx=9 "$1".7z "$1" || fail # normal
# 	# 	$notify
# 	# 	;;
# 	# tar)
# 	# 	tar cvf "$1".tar "$1" || fail
# 	# 	$notify
# 	# 	;;
# 	# tar.gz)
# 	# 	tar cvzf "$1".tar.gz "$1" || fail
# 	# 	$notify
# 	# 	;;
# 	# tar.bz2)
# 	# 	tar cjvf "$1".tar.bz2 "$1" || fail
# 	# 	$notify
# 	# 	;;
# 	*)
# 		;;
# 	esac;
# }
# archive "$1" "$2"
