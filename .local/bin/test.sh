#!/bin/bash

# # if [ "$#" -eq 1 ];then
# #     x="$(pwd)"
# # else
# #     # $2="$x"
# #     set -- second $x
# #     echo $2
# # fi

# # while ! [ "$*" == "" ];do
# #     echo "$1"
# #     shift
# # done
# # while ! [ "$@" == "" ];do
# #     echo "$1"
# #     shift
# # done

# # x=2
# # while :;do
# #     echo $x
# #     bc<<<"$x+1"
# # done

# while true;do
#     echo $x
#     [[ "$x" == "" ]] || break
# done

# # while
# #     echo 1
# # do [ "$?" -ne 0 ];done
# IFS=$'\n'
# x=$(find ./ -type d -name 'Downloads' -o -name 'Documents')
# x=$(find ./ -type d -name 'Downloads')
# # y='-l'
# # echo ${x} $y
# "${x} -o -name 'Documents'"
# arr=$('ls' 'neofetch' 'cmatrix')
# arr=('ls' 'neofetch' 'cmatrix')
# # echo "${arr[@]:1}"
# "${arr[0]}" -l
# ${arr[1]}

# echo "$1 $2 $3 $4 $5 $6"
# shift 3
# echo "$1 $2 $3 $4 $5 $6"

# LANG='master'
# read -rp "wpisz cos: " x
# echo $x
[[ -d "$*" ]] && echo all fonders && exit
echo not all folders
