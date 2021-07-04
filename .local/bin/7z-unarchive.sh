#!/bin/bash

for x in "$@";do
    # 7z x "$x" -o"${x}_DIR"
    7z x "$x" -o"${x//.*}"
done
