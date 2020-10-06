#!/bin/bash

sound_feed(){
	# eventually unmute and play sound
	pactl list sinks | grep -q "Mute: yes" && unmute 

	# comment here to remove sound feedback
	paplay /usr/share/sounds/freedesktop/stereo/bell.oga --volume=10000
}

get_vol(){
	SINK=$(pactl list short | grep RUNNING | head -n1| sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,')
	VOL=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
		head -n $(( ${SINK} + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
	printf "%02d" $VOL
}

unmute() {
pactl set-sink-mute @DEFAULT_SINK@ 0; dunstify " $(get_vol)" -r 99 
}

mute() {
pactl set-sink-mute @DEFAULT_SINK@ 1; dunstify " Mute" -r 99 
}
printf -v j "%05d" $tmp

case "$1" in
	-down) sound_feed & pactl set-sink-volume @DEFAULT_SINK@ -5%; dunstify " $(get_vol)" -r 99;;

	-up) sound_feed & pactl set-sink-volume @DEFAULT_SINK@ +5%;  dunstify " $(get_vol)" -r 99;;

	-mute) pactl list sinks | grep -q "Mute: yes" && unmute || mute ;;
esac

# @DEFAULT_SINK@ is useful to reference to the default one: https://wiki.archlinux.org/index.php/PulseAudio/Examples#Set_the_default_output_sink
