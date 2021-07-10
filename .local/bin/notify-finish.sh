#!/bin/bash
finish(){
notify-send "It's done" --icon=dialog-information
awk &>/dev/null '
BEGIN {
    k = 2
    while(k--) {
        i=j=500
        while (i--) print "a\0\0\0" | "aplay"
        while (j--) print "z\0\0" | "aplay"
    }
}

'
}
