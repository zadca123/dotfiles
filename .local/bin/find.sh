#!/bin/bash

display_help(){
	echo "Usage: $0 [name-of-searching-file]"
	echo "Usage: $0 [starting-location] [name-of-searching-file]"
    exit 2
}
if [ "$#" -eq 1 ];then
	find "$PWD" -mount -iname "*$1*" 2>/dev/null | \
		grep -i "$1" --color
elif [ "$#" -eq 2 ];then
	find "$1" -mount -iname "*$2*" 2>/dev/null | \
		grep -i "$2" --color
else
    display_help
fi



