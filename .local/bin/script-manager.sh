#!/bin/bash

echo Running scripts: 
ps -eo pid,euser,comm | grep "\.sh$"
echo -e "What you want to do? (example: k [pid], l [script-name]) \\n" \
	"k) - kill specific script \\n" \
	"K) - killall \\n" \
	"l) - list specified \\n" \
	"L) - list all \\n"

read -rp "Type here: " choice x
case "$choice" in
    k)
        echo Killing "$x" ...
        kill -9 "$x"
        ;;
    K) list=$(ps -eo pid,euser,comm | grep "\.sh$" | grep -i "$x" |awk 'NR==1 {print $3}')
       echo Killing all "$list" ...
       killall -9 "$list"
        ;;
    l) ps -eo pid,euser,comm | grep "\.sh$" | grep -i "$x"
        ;;
    L) ps -eo pid,euser,comm | grep "\.sh$"
        ;;
    *) echo Bad option ;;
esac
