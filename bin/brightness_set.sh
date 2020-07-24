#!/bin/bash
get_d(){
	T=$(lxqt-backlight_backend --show | awk '{print $2}')
	B=$(lxqt-backlight_backend --show | awk '{print $3}')
	if [[ $1 == "up" ]]; then
	printf "%2d" $(bc -l <<< $B/$T*100+10)
else
	printf "%2d" $(bc -l <<< $B/$T*100-10)
	fi

}

get_b(){
	T=$(lxqt-backlight_backend --show | awk '{print $2}')
	B=$(lxqt-backlight_backend --show | awk '{print $3}')
	printf "%2d" $(bc -l <<< $B/$T*100)
}



printf -v j "%05d" $tmp

case "$1" in
	-down) sudo lxqt-backlight_backend $(get_d) %; dunstify "☼ $(get_b)" -r 98;; 
	-up) sudo lxqt-backlight_backend $(get_d "up") %; dunstify "☼ $(get_b)" -r 98;; 
esac

