#!/bin/bash

clear
while true; do
    if [ -z "$1" ]; then
echo "Set alarm time in HH:MM AM/PM format"
read -r ALARM_TIME
else
ALARM_TIME="$1"
fi
if [[ "$ALARM_TIME" =~ (1[0-2]|0?[1-9]):([0-5]?[0-9])(\s?[AP]M)? ]]; then
echo "Alarm set to $ALARM_TIME"
break
else
echo "Invalid time format"
set --
unset ALARM_TIME
fi
done

run_at="$(date -d "$ALARM_TIME" +%s)"
current_time="$(date +%s)"
duration_to_sleep=$(( "$run_at"-"$current_time" ))

if [[ "$duration_to_sleep" -le "0" ]]; then
echo "Can't set an alarm at past time"
exit
fi

sleep "$duration_to_sleep"
notify-send "$2" --icon=dialog-information
awk &>/dev/null '
BEGIN {
    k = 10
    while(k--) {
        i=j=500
        while (i--) print "a\0\0\0" | "aplay"
        while (j--) print "z\0\0" | "aplay"
    }
}
'
exit
