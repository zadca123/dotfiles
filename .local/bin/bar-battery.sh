#!/bin/bash
# Luke Smith's battery script
battery=$(acpi | cut -d " " -f3-5 |  sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/❓/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g")
echo -e "$battery"

# # https://vivien.github.io/i3blocks/
# BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')

# # Full and short texts
# echo "Battery: $BAT"
# echo "BAT: $BAT"

# # Set urgent flag below 5% or use orange below 20%
# [ ${BAT%?} -le 5 ] && exit 33
# [ ${BAT%?} -le 20 ] && echo "#FF8000"
