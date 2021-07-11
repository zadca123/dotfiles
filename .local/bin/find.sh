#!/bin/bash

display_help(){
	echo "Usage: ${0##/*} [name-of-searching-file]"
	echo "Usage: ${0##/*} [starting-location] [name-of-searching-file]"
    exit 2
}

[[ -d $1 ]] && PWD="$1"
find "$PWD" -mount -iname "*$1*" 2>/dev/null | grep -i "$1" --color
display_help

# while getopts ':n:s:o:h' opt; do
#   case ${opt} in
#      n) find "$PWD" -mount -iname "*$1*" 2>/dev/null | grep -i "$1" --color
#          ;;
#      s) exit;;
#      o) exit;;
#      h)  display_help ;;
#      \?) display_help ;;
#      :)  display_help ;;
#   esac
# done

[[ -d "$1" ]] && PWD="$1"
fd="find $PWD -mount"
case "$2" in
   empty) $fd -empty -delete;;
   # corrupt) find "$PWD" -iname '*.mp3' | while read f; do  echo "mplayer -frames 20 ${f} || echo ${f} >> ~/bad.lst" >> check.sh ; done
       # ;;
   part) $fd -type f -name '*.part' -delete;;
   s) exit;;
   o) exit;;
   h)  display_help ;;
   \?) display_help ;;
   :)  display_help ;;
esac
