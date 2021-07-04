#!/bin/sh

notify=$(notify-send "Archiving Done")
fail() {
  notify-send -u low -i image "Archiving failed."
  exit
}

archive(){
	case $2 in
	zip)
		zip -r9 "$1".zip "$1" || fail
		$notify
		;;
	7z)
		7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "$1".7z "$1" || fail # ultra
		# 7z a -mx=9 "$@".7z "$@" || fail # normal
		$notify
		;;
	tar)
		tar cvf "$1".tar "$1" || fail
		$notify
		;;
	tar.gz)
		tar cvzf "$1".tar.gz "$1" || fail
		$notify
		;;
	tar.bz2)
		tar cjvf "$1".tar.bz2 "$1" || fail
		$notify
		;;
	*)
		;;
	esac;
}
archive "$1" "$2"
