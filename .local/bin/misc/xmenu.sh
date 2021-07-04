#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	IMG:./icons/web.png	Web Browser/Waterfox	waterfox-current
	IMG:			Web Browser/vimb	vimb
	IMG:			File Manager		pcmanfm
	IMG:			Steam 			steam
	IMG:			Teamspeak 3		teamspeak3
	IMG:			Screenshot Tool		flameshot gui
	IMG:			Abiword			abiword
Media                                           	
	IMG:			Music Player		alacritty -e abduco -A cmux cmus
	IMG:			Video Player		mpv
Settings
	IMG:			Audio			pavucontrol
	IMG:			Apperance 		lxappearance
	IMG:			Wallpaper		nitrogen
Terminal (st)		st
Terminal (alacritty)	alacritty

Shutdown		poweroff
Reboot			reboot
EOF
