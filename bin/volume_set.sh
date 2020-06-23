#!/bin/bash
get_vol(){
	pactl list sinks | grep '^[[:space:]]Volume:' | \
		head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}

unmute() {
pactl set-sink-mute 0 0; dunstify " $(get_vol)" -r 99 
}

mute() {
pactl set-sink-mute 0 1; dunstify " Mute" -r 99 
}

toggle() {
	S=$(pactl list sinks | grep -q Mute:.no)
	$S && pactl set-sink-mute 0 1 || pactl set-sink-mute 0 0
	$S
}

case "$1" in
	-down) pactl set-sink-volume 0 -5%; dunstify " $(get_vol)" -r 99;;

	-up) pactl set-sink-volume 0 +5%; dunstify " $(get_vol)" -r 99;;

	-mute) pactl list sinks | grep -q Mute:.no && mute || unmute ;;
esac

#/home/meme/.local/bin/dunstify "prova"
