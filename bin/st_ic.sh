#!/bin/bash

# st build from https://github.com/LukeSmithxyz/st 

#for i in $(pgrep -w '\<'${term}'\>'); do
#sleep 1
#win=$(xdotool search --pid $i)
#xseticon -id "$win" /home/meme/bin/ICONS/face.png 
#xseticon -id "$win" /home/meme/bin/ICONS/faceW.png 
#xid=$(wmctrl -lp | awk -vpid=$i '$3==pid {print $1; exit}')	
#python2 /home/meme/bin/windowtool.py --decorations 0 "$xid"
#done
#tot_inst=$(pgrep -w '\<'st'\>' | wc -l)
#remainder=$(( $tot_inst % 2 ))

#SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
#HALF=$(( $SCREEN_WIDTH / 2 )) 
#/home/meme/bin/./st &

st &
#echo $!
sleep .2
#xid=$(wmctrl -lp | awk -vpid=$! '$3==pid {print $1; exit}')	
win=$(xdotool search --pid $!)
#st -c "echo $win"
#Decide left/right if is odd or even
#Left or right screen. Using ubuntu shortuct..
#xdotool windowfocus $win
#if [ $remainder = 1 ]; then
	#xdotool key Super+Left
	#wmctrl -i -r  "$xid" -e 0,0,0,$HALF,-1 
#else
	#xdotool key Super+Right
	#wmctrl -i -r "$xid" -b remove,maximized_vert & wmctrl -i -r  "$xid" -e 0,$HALF,0,$HALF,-1
#fi
#xdotool windowfocus $win
#wmctrl -ia $xid
#sleep .1

/home/meme/bin/xseticon -id "$win" /home/meme/bin/ICONS/faceW.png 
