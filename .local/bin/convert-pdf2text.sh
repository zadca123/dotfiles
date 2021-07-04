#!/bin/bash

if [ "$#" -ge 1 ];then
    for i in "$@";do
        # pdftotext "$i"
        # pdftotext -eol "$1" -nopgbrk "$i"
        pdftotext -nopgbrk "$i"
    done
else
	echo Usage: "$0" '[file/s]'
fi
