#!/bin/bash

ps -eo pid,euser,comm | grep "\.sh$"

# if [ "$?" -eq 0 ];then 
# 	# pkill "$(ps -eo pid,comm | pgrep -i "$1")"
# else
# 	echo There is no running scripts like this
# fi

