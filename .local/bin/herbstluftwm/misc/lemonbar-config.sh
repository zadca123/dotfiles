#!/bin/bash

bg="#2D2D2D"
fg="#dedede"

Format() {
	echo "%{+u}%{B$bg} $1 %{B}%{-u}"
}

# Workspaces() {
# 	#desktops=$(sprintf X %s/%s tags.focus.index tags.count echo X)
# 	desktops=$(herbstclient sprintf X %s tags.focus.index echo X)
#   focused=$(herbstclient sprintf STR %s clients.focus.title echo STR)

# 	for desktop in $desktops; do
# 		desktop=$(echo "$desktop")
# 		nodes=$(bspc query -N -d $desktop)

# 		if [ ! -z "$nodes" ]; then
# 			desktops=$(echo $desktops | sed "s/$desktop/%{F#ff0000}$desktop%{F-}/")
#     fi

#   done
#   desktops=$(echo $desktops | sed "s/$focused/%{B$bg}%{+u}_$focused\_%{-u}%{B-}/")

#   echo $desktops | sed "s/_/ /g"
# }
workspace_temp() {

	desktops=$(herbstclient sprintf X %s/%s tags.focus.index tags.count echo X)
  	focused=$(herbstclient sprintf STR %s clients.focus.title echo STR)
  	echo "$desktops $focused"
}
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo "$mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo "CPU: $cpu%"
}
vol() {
	vol=$(ponymix get-volume)
	echo "$vol%"
}
sound(){
	mute=$(ponymix | grep -o Muted)
	vol=$(ponymix get-volume)
	output=""

	if [ "$mute" = "Muted" ]; then
	  output="🔇 mute"
	elif [ "$(echo "$vol" | tr -d "%")" -gt 70 ]; then
	  output="🔊 $vol%"
	elif [ "$(echo "$vol" | tr -d "%")" -gt 35 ]; then
	  output="奔 $vol%"
	else
	  output="🔈 $vol%"
	fi

	echo "$output"
}
## MUSIC
#mocp(){
#	artist=`mocp -Q %artist`
#	song=`mocp -Q %song`
#	echo -e "$artist - $song"
#}
music(){

	album=`cmus-remote -C status | awk '$2=="album" {$1=$2="";print substr($0,3)}'`
	artist=`cmus-remote -C status | awk '$2=="artist" {$1=$2="";print substr($0,3)}'`
	song=`cmus-remote -C status | awk '$2=="title" {$1=$2="";print substr($0,3)}'`	
	song_vol=`cmus-remote -C status | awk '$2=="vol_left" {$1=$2="";print substr($0,3)}'`	
	echo -e "$album > $artist > $song > $song_vol%"
}
# mpd(){
# 	song=$(mpc | awk 'NR==1')	
# 	vol=$(mpc | awk 'NR==3 {print $2}')
# 	status=$(mpc | awk 'NR==2 {print $1}')
# 	output=""
# 	if [ "$status" = "[playing]" ]; then
# 		output="▶️[playing]"
# 	elif [ "$status" = "[paused]" ]; then
# 		output="⏸️[paused]"
# 	else
# 		output="⬛[stopped]"
# 	fi
# 	echo "$output $song > $vol"
# }

clock(){
	DATE=$(date "+%a %b %d")
	TIME=$(date "+%R")

	Format "${DATE} [${TIME}]"
}
SLEEP_SEC=3
while :; do
    echo -e "%{l} %{F#e32264}$(workspace_temp) %{c} %{F#e50000} $(music) %{r}%{F#f37735}$(sound) | %{F#e6c3ad}$(cpu) | %{F#96bb7c}$(mem) | %{F#468fea}$(clock) "
	sleep $SLEEP_SEC
done
