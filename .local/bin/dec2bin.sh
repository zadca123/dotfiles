#!/bin/bash

# D2B=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
# for x in "$@";do
# 	echo -n "${D2B[$x]} "
# done
# echo "${D2B[$@]} ${D2B[$@]} ${D2B[$@]} ${D2B[$@]}"

# bc sposób
# IP=$1
# echo "obase=2;$IP" | bc

# old
if [ $# -eq 1 ];then
	liczba=$1
	while [ "$liczba" -ne 0 ];do
		if [ $((liczba%2)) -eq 0 ];then
			# echo -e $liczba \\t 0
			echo -e $liczba \\t 0
			let liczba=liczba/2
		else
			# echo -e $liczba \\t 1
			echo -e $liczba \\t 1
			let liczba=liczba/2
		fi
	done
else
	echo Usage: $0 [number]
fi
