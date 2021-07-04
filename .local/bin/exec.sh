#!/bin/bash

[[ ! -x "$1" ]] && \
        chmod +x "$1" && \
        sh "$1" && \
        exit
sh "$1"

# ! [[ -x "$1" ]] && echo dziala
# [[ ! -x "$1" ]] && echo dziala
# # obie powyższe metody działają
