#!/bin/bash

xd=`audacious -enqueue`
find ./ -mount -name  "*.$@" -exec $xd "{}" 2>/dev/null \;

exit
