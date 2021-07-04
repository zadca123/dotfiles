#!/bin/bash

location="$1"
LIST=$(find "$location" \( -iname '*ê*' -or -iname '*qweqwe*' \) )
echo "$LIST"
