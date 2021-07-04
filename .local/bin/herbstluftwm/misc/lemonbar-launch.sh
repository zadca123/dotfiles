#!/bin/bash
# Launches an instance of lemonbar
killall -q lemonbar
killall -q lemonbar-config.sh

lemonbar-config.sh | lemonbar -p -g 2560x22+0+0 -F "#FFFFFFFF" -B "#FF222222" -U "#268bd2" -u 3 -f "JetBrains Mono Medium"-14 -o -1 -f "InputMono"-18| $SHELL
