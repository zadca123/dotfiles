#!/bin/bash

if [ "$#" -eq 2 ];then
	ebook-convert "$1" "${1%.*}.$2"
else
	echo Usage: "$0" [file] "[format-to-convert]"
fi
