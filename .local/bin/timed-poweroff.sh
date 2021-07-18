#!/bin/bash

# echo Timed poweroff of PC 
# read -rp 'Give time (in minutes): ' time
# ((time *= 60))
# sleep "$time"
# while [ $time -gt 0 ];do
#     echo "$time"
#     (( time =- 1 ))
#     sleep 1
# done
# sudo poweroff
# # time="$1"
# # sleep "${time}m" # in minutes

time="$1"
while [[ $time -gt 0 ]]; do
    echo -ne "$time minutes remaining before shutdown..."
    (( time -= 1 ))
    sleep 1m
done
echo shutdown now
