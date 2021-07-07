#!/bin/bash

display_help(){
    echo usage: [ru,pl,en,jp] [something to translate]
    exit 2
}

[[ $# -lt 2 ]] && display_help

trans -tl "$1" -hl "$1" "${*:2}"
[[ -f /bin/tuxi ]] && tuxi "${*:2}"
