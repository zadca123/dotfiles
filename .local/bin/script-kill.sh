#!/bin/bash

ps -eo pid,euser,comm | grep -i "$1"

if [ "$?" -eq 0 ];then 
	pkill "$(ps -eo pid,comm | pgrep -i "$1")"
else
	echo There is no process like this
fi

