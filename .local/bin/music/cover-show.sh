#!/bin/bash

MUCH=$(cmus-remote -Q | grep file |grep -c '/')
echo $MUCH
HERE=$(cmus-remote -Q |\
	grep '^file ' |\
	cut -d' ' -f2-99 |\
	cut -d'/' -f"$MUCH")
echo "$HERE"
