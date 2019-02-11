#!/bin/bash
H=$(date +%H)
term='st'

if [[ $H > 21 || "$1" == "dark" ]]
then	term='st'
fi

/home/meme/bin/./$term &> /dev/null & 


for i in $(pgrep -w '\<'${term}'\>'); do
	sleep 1
	win=$(xdotool search --pid $i)
	#xseticon -id "$win" /home/meme/bin/ICONS/face.png 
	xseticon -id "$win" /home/meme/bin/ICONS/faceW.png 
done


