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
