#!/bin/sh
# A super hacky script to display the torrents in transmission in a notification

# torrents="$(transmission-remote -l | grep -v Done | grep -v Stopped)"
torrents=$(transmission-remote -l | sed '/Sum/d')
notify-send "Seeding torrents" "$(echo "$torrents" | sed '1d' | grep Seeding | awk '{printf $2 " " $3 " " $4 " "}{for(i = 10; i < 30; i++) printf $i" "}{print ""}' | awk '{$1=$1};1')"

# Updates the bar torrents module
# if pgrep "polybar"; then
#   polybar-msg -p "$(pidof "polybar")" hook torrents 1
# fi

#awk '{print $2 "\t" $3 "\t"}{for(i = 9; i < 20; i++) printf $i}'
#echo "$torrents" | sed '1d' | awk '{printf $2 "\t" $3}{for(i = 1; i < 10; i++) $i=""}{print}'
