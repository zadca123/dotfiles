#!/bin/bash

# ig1=$(ls /var/cache/pacman/pkg/ | grep nvidia | cut -d'/' -f2 | cut -d' ' -f1 | awk NR==1)
# ig2=$(ls /var/cache/pacman/pkg/ | grep nvidia | cut -d'/' -f2 | cut -d' ' -f1 | awk NR==2)
# ig3=$(ls /var/cache/pacman/pkg/ | grep nvidia | cut -d'/' -f2 | cut -d' ' -f1 | awk NR==3)

ig1=$(ls /var/cache/pacman/pkg/ | awk NR==1)
ig2=$(ls /var/cache/pacman/pkg/ | awk NR==2)

sudo pacman -Scc --ignore "$ig1" --ignore "$ig2"
