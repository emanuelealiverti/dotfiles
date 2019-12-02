#!/bin/bash
#
# @version      1.0
# @script       keep-battery-updated
# @description  keeps the battery status updated
#
##

while sleep 10; do
    badbattery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state: | cut -d ':' -f 2 | xargs)
    if [ $badbattery = discharging ]; then
        python2 /home/meme/bin/battery/get_power_info.py
    fi
done
