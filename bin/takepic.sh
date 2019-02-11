#!/bin/bash
end=$((SECONDS+5))

#while [ $SECONDS -lt $end ]; do
    # Do what you want.
t=`date`
ts=`date +%s`
ffmpeg -f video4linux2 -s vga -i /dev/video0 -vframes 1 /tmp/vid-$ts.%01d.jpg

Rscript /home/meme/bin/mex.R
#for i in /tmp/vid-*.jpg; do
#	cc='send_photo Meme '$i''
	#echo $cc
#timeout 3 /home/meme/bin/tg/telegram-cli -WR -e "$cc"
#done

#done
exit 0
