#!/bin/bash
# baraction.sh for spectrwm status bar

mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e " $mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e " $cpu%"
}

vol() {
    #vol=`amixer get Master | awk -F'[][]' 'END{ print $2" "$4 }' | sed 's/on://g'`
    vol=`ponymix get-volume`
    echo -e " $vol%"
}

music(){
#	### MOCP ###
#	artist=`mocp -Q %artist	-C ~/.config/moc/config`
#	song=`mocp -Q %song 	-C ~/.config/moc/config`
#	#vol='ponymix list | grep "Music on Console"'
#	echo -e "$artist - $song"
#
#	### MPD ###
#	song=`mpc | awk 'NR==1'`	
#	vol=`mpc | awk 'NR==3 {print $2}'`
#	echo -e "$song > $vol"
#
#	### CMUS ### (not perfect)
	album=`cmus-remote -C status | awk '$2=="album" {$1=$2="";print substr($0,3)}'`
	artist=`cmus-remote -C status | awk '$2=="artist" {$1=$2="";print substr($0,3)}'`
	composer=`cmus-remote -C status | awk '$2=="composer" {$1=$2="";print substr($0,3)}'`
	song=`cmus-remote -C status | awk '$2=="title" {$1=$2="";print substr($0,3)}'`	
	song_vol=`cmus-remote -C status | awk '$2=="vol_left" {$1=$2="";print substr($0,3)}'`
  # all_in_one=`cmus-remote -C status | awk '{if ($2=="title" || $2=="artist" || $2=="vol_left") print substr($0,3)}'`

	echo -e "ﱘ $artist > $composer > $song >  $song_vol%"

#	if [ "$mute" = "yes" ]; then
#	  output="🔇 mute"
#	elif [ "$(echo "$vol" | tr -d "%")" -gt 70 ]; then
#	  output="🔊 $vol"
#	elif [ "$(echo "$vol" | tr -d "%")" -gt 35 ]; then
#	  output="奔 $vol"
#	else
#	  output="🔈 $vol"
#	fi
#
#	Format "$output"

}

SLEEP_SEC=3
while :; do
    echo " +@bg=4; $(music) +@bg=0; +@bg=5; $(vol) +@bg=0; +@bg=6; $(cpu) +@bg=0; +@bg=7; $(mem) +@bg=0;"
	sleep $SLEEP_SEC
done
