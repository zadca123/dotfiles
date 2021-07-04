#!/bin/bash

chmod -vR 644 "$1" && \
find "$1" -type d -exec chmod -v 755 {} \;

"$?" -ne 0 && sudo "$0" "$1"
