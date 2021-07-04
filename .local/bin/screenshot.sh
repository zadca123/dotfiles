#!/bin/sh
# location=~/Documents/screenshots
# name=$location/%Y-%m-%d_%H:%M:%S_$wx$h.png
TMP=/tmp/screenshot.png
screenshotfail (){
  notify-send -u low -i image "$1 screenshot failed."
  exit
}
screenshot() {
	case $1 in
	clipboard)
		sleep 1
		scrot -s -f -l style=dash,width=3,color=cyan "$TMP" || screenshotfail "$@"
		xclip -selection clipboard -t image/png "$TMP" || screenshotfail "$@"
		rm -f "$TMP"
		notify-send -u low -i image "600px screenshot copied to clipboard"
		;;
	select)
		sleep 1
		scrot -s -f -l style=dash,width=3,color=cyan '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Documents/screenshots/' || screenshotfail "$@"
		notify-send "Selected screenshot taken"
		;;
	full)
		scrot -m '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Documents/screenshots/' || screenshotfail "$@"
		notify-send "Full screenshot taken"
		;;
	focused)
		scrot --focused '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Documents/screenshots/' || screenshotfail "$@"
		notify-send "Focused screenshot taken"
		;;
	16x9)
		scrot -m -a 320,0,1920,1080 '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Documents/screenshots/' || screenshotfail "$@"
		notify-send "16x9 screenshot taken"
		;;
	4x3)
		scrot -m -a 560,0,1440,1080 '%Y-%m-%d_%H:%M:%S_$wx$h.png' -e 'mv $f ~/Documents/screenshots/' || screenshotfail "$@"
		notify-send "4x3 screenshot taken"
		;;
	*)
		;;
	esac;
}

screenshot "$1"
