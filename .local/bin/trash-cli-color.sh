#!/bin/sh
# Colorized trash-cli output

list(){
  trash-list |
    awk -v BLUE="\033[1;34m" -v YELLOW="\033[0;33m" \
      -v RED="\033[1;31m" '{ DATE=$1; TIME=$2; $1=""; $2="";
      print YELLOW DATE " " BLUE TIME RED $0 }'
}

# restore(){
#   trash-restore |
#     awk -v BLUE="\033[1;34m" -v YELLOW="\033[0;33m" \
#       -v RED="\033[1;31m" '{ DATE=$2; TIME=$3; $1=""; $2="";
#       print YELLOW DATE " " BLUE TIME RED $0 }'
# }

case "$1" in
  "ls"|"list"|"") list ;;
  # "rest"|"restore") restore ;;
  "em"|"empty") trash-empty ;;
  *) trash-put "$@" ;;
esac
