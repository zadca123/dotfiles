#!/bin/bash

for x in "$@";do
    zip -r9 "${x}.zip" "$x"
done
