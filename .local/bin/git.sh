#!/bin/bash

display_help(){
    echo "Usage: ${0##*/} -[n|u|g]"
    echo "--new-repo [n]"
    echo "--update [u]"
    echo "--get [g]"
    exit 2
}

[[ "$#" -lt 1 ]] && display_help

br='master'
case "$1" in
    -u | --update)
        git commit -a -m 'updating files'
        git push -u origin "$br"
        ;;
    -n | --new-repo)
        read -rp "github username: " u
        read -rp "github project name: " p
        git init
        echo -e "# +TITLE: ${p}\\n* ${p}" > README.org
        git add README.org
        git commit -m 'first commit'
        git branch -M "$br"
        git remote add origin "https://github.com/${u}/${p}.git"
        git commit -a -m 'using script to do this stuff'
        git push -u origin "$br"
        ;;
    -g | --get)
        read -rp "github username: " u
        read -rp "github project name: " p
        git clone "https://github.com/${u}/${p}.git"
        ;;
    "") display_help;;
    *) git "$@";;
esac
