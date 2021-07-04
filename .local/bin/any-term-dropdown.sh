#!/bin/bash

# dependencies: xdotool, wmutils
ROOT=`lsw -r`
width=`wattr w $ROOT`
height=`wattr h $ROOT`

my_term="st"

pid=`xdotool search --class "$my_term" | tail -n1`
wid=`printf 0x%x "$pid"`
wrs "$width" "$height" "$wid"
