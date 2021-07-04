#!/bin/sh
#CHECK IF I3LOCK IS RUNNING AND SUSPEND AFTER 5 MINS

while true; do
    lock=$( ps aux | grep '[i3]lock')
    if [ -n "$lock" ]; then
        sleep 5m
        systemctl suspend
    fi
    sleep 5
done
