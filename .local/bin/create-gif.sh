#!/usr/bin/env bash
# set -euo pipefail

case "$1" in
    create)
        convert "${@:3}" "$2"
        ;;
    *)
        echo Usage: "$0" '[create] [name.gif] [image/s]'
        ;;
esac
