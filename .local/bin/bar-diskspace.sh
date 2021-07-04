#!/bin/bash

mounted=$(df -h | egrep "home|mnt|sda" | grep -v boot | tr -s ' ' ';' |cut -d';' -f4,6 | tr -s ';' ' ' | tr -s '\n' '|')
echo -e "$mounted"
