#!/bin/bash

class=$(echo -e "$(xprop | grep "WM_CLASS\|_NET_WM_NAME\|WM_NAME")")
notify-send -t 10000 "$class"
