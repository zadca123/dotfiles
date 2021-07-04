#!/bin/bash

if [ $# -eq 4 ];then
	find "$1" -type f -name "*.$2" -exec "$3" "{}" "$4" \;
elif [ $# -eq 3 ];then
	find "$1" -type f -name "*.$2" -exec "$3" "{}" \;
else
	echo Niepoprawna liczba argumentów.
	echo Podaj 3 argumenty: "$0" '[lokacja-startowa] [rozszerzenie] [komenda]'
	echo Podaj 4 argumenty: "$0" '[lokacja-startowa] [rozszerzenie] [komenda] [lokacja-docelowa]'
fi

