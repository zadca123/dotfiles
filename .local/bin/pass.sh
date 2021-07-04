#!/bin/bash

case "$1" in
    insert)
        pass "$1" "$2"
        # pass "$1" shift "$@"
        ;;
    *)
        echo cos zjebane
        ;;
esac
