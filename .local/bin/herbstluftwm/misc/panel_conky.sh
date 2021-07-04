#!/bin/bash
# Herbstluftwm + dzen2 + conky base configuration status bar:
# >>>>>>>>>>> panel.sh

## dzen stuff
FG='#CCCCCC'
BG='#333333'
FONT="-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*"

function uniq_linebuffered() {
   awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

{
   conky -c ~/.conky/statusbar | while read -r; do
      echo -e "conky $REPLY";
     
   done > >(uniq_linebuffered) &
   childpid=$!
   herbstclient --idle
   kill $childpid
} | {
   TAGS=( $(herbstclient tag_status $monitor) )
      conky=""
      separator="^fg(#333333)^ro(1x16)^fg()"
      while true; do
         for i in "${TAGS[@]}"; do
            echo -n "^ca(1,herbstclient use ${i:1}) "
            case ${i:0:1} in
            '#')
               echo -n "^fg(#2290B5)[^fg(#CCCCCC)${i:1}^fg(#2290B5)]"
               ;;
            ':')
               echo -n "^fg(#CCCCCC) ${i:1} "
               ;;
            *)
               echo -n "^fg(#2290B5) ${i:1} "
               ;;
            esac
            echo -n "^ca()"
        done
        echo -n " $separator"
        conky_text_only=$(echo -n "$conky "|sed 's.\^[^(]*([^)]*)..g')
        width=$(textwidth "$FONT" "$conky_text_only  ")
        echo -n "^p(_RIGHT)^p(-$width)$conky"
        echo
        read line || break
        cmd=( $line )
   case "$cmd[0]" in
               tag*)
                  TAGS=( $(herbstclient tag_status $monitor) )
                  ;;
               conky*)
                  conky="${cmd[@]:1}"
                  ;;
               esac
     done
} 2> /dev/null |dzen2 -ta l -y 0 -x 0 -h 16 -w 1920 -fg $FG -bg $BG -fn $FONT &

---------------------------------

>>>>>>>>>>> ~/.conky/statusbar

## No output to X <yes/no>
out_to_x no

## Create own window to draw <yes/no>
own_window no

## Print everything to console?
out_to_console yes

## Use double buffering (reduces flicker, not needed for console output)
double_buffer no

## Set to yes if you want Conky to be forked in the background
background no

## Update interval in seconds
update_interval 1.0

## This is the number of times Conky will update before quitting.
## Set to zero to run forever.
total_run_times 0

## How strict should if_up be when testing an interface for being up?
## The value is one of up, link or address, to check for the interface
## being solely up, being up and having link or being up, having link
## and an assigned IP address. 
if_up_strictness address


## Force UTF8? note that UTF8 support required XFT
override_utf8_locale no

TEXT
ARCH LINUX $kernel $machine UPTIME $uptime | CPU ${cpu}%  RAM ${memperc}% | TEMP CPU ${hwmon temp 1} GPU ${execi 2 nvidia-settings -query GPUCoreTemp | grep Attribute | cut -c44-45} MB ${hwmon temp 2} | /SYSTEM ${fs_used /}/${fs_free /} /HOME ${fs_used /home/}/${fs_free /home/} | Enp3s0 DOWN ${downspeed enp3s0} UP ${upspeed enp3s0} | ${time %A %d %B %Y, %H:%M:%S}

------------------------
Line for a laptop with wifi signal quality and battery % and left time.

CPU ${cpu}%  RAM ${memperc}% | TEMP CPU ${hwmon temp 1} | /SYSTEM ${fs_used /}/${fs_free /} /HOME ${fs_used /home/}/${fs_free /home/} | wlp4s0 SQ ${wireless_link_qual wlp4s0}% DOWN ${downspeed wlp4s0} UP ${upspeed wlp4s0} | BAT ${exec acpi -b | grep "Battery 0" | awk '{ print $4}'} ${battery_time BAT0} | ${time %A %d %B %Y, %H:%M:%S}
