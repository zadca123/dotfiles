#!/bin/bash
🔊
statuss=$(cmus-remote -Q | awk '$1=="status" {$1="";print substr($0,2)}')
album=$(cmus-remote -Q | awk '$2=="album" {$1=$2="";print substr($0,3)}')
artist=$(cmus-remote -Q | awk '$2=="artist" {$1=$2="";print substr($0,3)}')
title=$(cmus-remote -Q | awk '$2=="title" {$1=$2="";print substr($0,3)}')	
# composer=$(cmus-remote -Q | awk '$2=="composer" {$1=$2="";print substr($0,3)}')
vol=$(cmus-remote -Q | awk '$2=="vol_left" {$1=$2="";print substr($0,3)}')
most=$(cmus-remote -Q \
    | grep "tag album\|tag albumartist\|tag composer\|tag artist\|tag title" \
    | cut -d' ' -f3-)

no_tags=$(cmus-remote -Q | awk '$1=="file" {$1=$2="";print substr($0,3)}')

if [ "$title" == "" ];then
	echo -e "$statuss > $no_tags > 🔊 $vol%"
else
	echo -e "$statuss > $title > $album > $artist > 🔊 $vol%"
fi
