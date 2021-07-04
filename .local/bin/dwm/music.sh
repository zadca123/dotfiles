#!/bin/bash
# ### CMUS ### (not perfect)
album=`cmus-remote -Q | awk '$2=="album" {$1=$2="";print substr($0,3)}'`
artist=`cmus-remote -Q | awk '$2=="artist" {$1=$2="";print substr($0,3)}'`
composer=`cmus-remote -Q | awk '$2=="composer" {$1=$2="";print substr($0,3)}'`
song=`cmus-remote -Q | awk '$2=="title" {$1=$2="";print substr($0,3)}'`	
song_vol=`cmus-remote -Q | awk '$2=="vol_left" {$1=$2="";print substr($0,3)}'`
echo -e "$artist > $composer > $song > $song_vol%"

# # all_in_one=`cmus-remote -Q | awk '{if ($2=="title" || $2=="artist" || $2=="vol_left") print substr($0,3)}'`
# curr_song="cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- | tr '\n' ' - '"
# curr_song="cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- | sed ':a;N;$!ba;s/\n/ - /g'"

# curr_song=`cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- | sed ':a;N;$!ba;s/\n/ - /g'`
# echo -e "$curr_song"
