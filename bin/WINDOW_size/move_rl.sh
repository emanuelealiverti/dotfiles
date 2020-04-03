#!/bin/bash
#Move to side of the screen + remvove border
#From System side: Ctr+Super+L shold move windows
if [[ "$1" == "l" ]]; then 
 xdotool key Ctrl+Super+Left
else
 xdotool key Ctrl+Super+Right
fi

python2 /home/meme/bin/windowtool.py --decorations 0 ACTIVE &
