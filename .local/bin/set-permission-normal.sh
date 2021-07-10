#!/bin/bash

[[ $# -ne 1 ]] && echo podaj 1 argument && exit 2
chown -vR "$USER":"$USER" "$1"
chmod -vR 644 "$1" && \
find "$1" -type d -exec chmod -v 755 {} \;

# "$?" -ne 0 && sudo "$0" "$1"
