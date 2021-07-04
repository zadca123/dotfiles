#!/bin/bash

echo -ne Timed poweroff of PC \\n \
	Give time \(in minutes\): 
read -r time
# sudo shutdown +"$time"

((time *= 60))
sudo su
sleep "$time"
sudo poweroff
