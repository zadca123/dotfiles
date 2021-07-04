#!/bin/bash

for file in /path/to/dirA/*; do
    fileName=${file##*/}
    diff -q <(sort "$file") <(sort /path/to/dirB/"$fileName") && 
    rm /path/to/dirB/"$fileName"
done
