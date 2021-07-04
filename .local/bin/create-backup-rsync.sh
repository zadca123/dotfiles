#!/bin/bash

[[ "$#" -eq 2 ]] && \
    mkdir -p "$2" && \
    rsync -ahzAxmivP "$1" "$2" && \
    exit 0
    
echo Usage: "$0" '[dir/file-to-backup] [backup-location]'
