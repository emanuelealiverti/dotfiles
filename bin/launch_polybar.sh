#!/bin/bash


main() {
	def=${1:-mm}
	killall polybar
	for m in $(xrandr --query | grep " connected" | grep $def| cut -d" " -f1); do
		#MONITOR=$m polybar --reload meme >> /tmp/polybar_runlog 2>&1 &
		MONITOR=$m polybar meme >> /tmp/polybar_runlog 2>&1 &
	done
}

case "$1" in
	-int)  main DP ;;
	-ex|-ext)  main HDMI ;;
	*) main ;;
esac
