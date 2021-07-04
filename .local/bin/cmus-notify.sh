#!/bin/bash

cover-music-generate.sh
# title=$(cmus-remote -Q | awk '$2=="title" {$1=$2="";print substr($0,3)}')
# album=$(cmus-remote -Q | awk '$2=="album" {$1=$2="";print substr($0,3)}')
# artist=$(cmus-remote -Q | awk '$2=="artist" {$1=$2="";print substr($0,3)}')
# composer=$(cmus-remote -Q | awk '$2=="composer" {$1=$2="";print substr($0,3)}')
statuss=$(cmus-remote -Q | awk '$1=="status" {$1="";print substr($0,2)}')
vol=$(cmus-remote -Q | awk '$2=="vol_left" {$1=$2="";print substr($0,3)}')

most=$(cmus-remote -Q \
    | sed 's/^tag //g' \
    | grep "^status\|^album\|^albumartist\|^composer\|^artist\|^title\|^vol_left" \
    | cut -d' ' -f2-)
position=$(cmus-remote -Q | grep ^position | cut -d' ' -f2)
duration=$(cmus-remote -Q | grep ^duration | cut -d' ' -f2)
time1=$(date -d@"$position" -u +%H:%M:%S)
time2=$(date -d@"$duration" -u +%H:%M:%S)
all_in_one=$(echo -e "$most"\\n"${time1}/${time2}"\\nVol: "$vol"%)


# no_tags=$(cmus-remote -Q | grep ^file | rev |cut -d'/' -f1 | rev)
no_tags=$(cmus-remote -Q | grep ^file | sed s%/\*.\*./%%)

# tags=$(echo -e "$statuss"\\n"$title"\\n"$album"\\n"$artist"\\n"${time1}/${time2}"\\nVol: "$vol"%)

if [ "$most" == "" ];then
	notify-send -i "/tmp/cover.png" -t 4400 "$no_tags"
else
	notify-send -i "/tmp/cover.png" -t 4400 "$all_in_one"
fi

# set this in cmus
# :set status_display_program=<path-to-the-shell-script>

