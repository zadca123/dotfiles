#!/bin/bash

echo -e How to delete? \\n \
	l - list packages that dont depent other packages \\n \
	L - delete above listed packages \\n \
	D,d - with all dependencies \\n \
	S,s - safe, some dependencies \\n \
	C,c - delete cache pacman and paru \\n \
	N,n - normal, only this package \\n

read -rp "Type here: " choice
case "$choice" in 
	D|d) sudo pacman -Rcns "$@" ;;
	S|s) sudo pacman -Rncssu "$@" ;;
	C|c) sudo pacman -Scc && paru -Scc  ;;
	N|n) sudo pacman -R "$@" ;;
	l) pacman -Qdtq ;;
	L) sudo pacman -r $(pacman -Qdtq) ;;
	*) echo Bad option ;;
esac
