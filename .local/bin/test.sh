#!/bin/bash

#SCRIPT=`basename ${BASH_SOURCE[0]}`

### Let's do some admin work to find out the variables to be used here
#BOLD='\e[1;31m'         # Bold Red
#REV='\e[1;32m'       # Bold Green

##Help function
#function HELP {
#  echo -e "${REV}Basic usage:${OFF} ${BOLD}$SCRIPT -d helloworld ${OFF}"\\n
#  echo -e "${REV}The following switches are recognized. $OFF "
#  echo -e "${REV}-p ${OFF}  --Sets the environment to use for installing python ${OFF}. Default is ${BOLD} /usr/bin ${OFF}"
#  echo -e "${REV}-d ${OFF}  --Sets the directory whose virtualenv is to be setup. Default is ${BOLD} local folder (.) ${OFF}"
#  echo -e "${REV}-v ${OFF}  --Sets the python version that you want to install. Default is ${BOLD} 2.7 ${OFF}"
#  echo -e "${REV}-h${OFF}  --Displays this help message. No further functions are performed."\\n
#  echo -e "Example: ${BOLD}$SCRIPT -d helloworld -p /opt/py27env/bin -v 2.7 ${OFF}"\\n
#  exit 1
#}

#PYENV='/usr/bin'
#DIR='.'
#VERSION='2.7'

## In case you wanted to check what variables were passed
## echo "flags = $*"

#while getopts p:d:v:h opt; do
#  case $opt in
#    d)
#      DIR=$OPTARG
#      ;;
#    p)
#      PYENV=$OPTARG
#      ;;
#    v)
#      VERSION=$OPTARG
#      ;;
#    h)
#      HELP
#      ;;
#    \?) #unrecognized option - show help
#      echo -e \\n"Option -${BOLD}$OPTARG${OFF} not allowed."
#      HELP
#      ;;
#  esac
