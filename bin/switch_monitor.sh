#!/bin/bash

# Changes also if GPU is connected or not
intern=eDP-1
extern=HDMI-1

main() {
	case "$1" in
		-e|external) 
			xrandr --output "$intern" --off --output "$extern" --auto
			poly_script
			;;
		-i|internal)  xrandr --output "$extern" --off --output "$intern" --auto
			poly_script -int
			;;
		-a|above)
			xrandr --output "$intern" --primary --auto \
				--output "$extern" --auto \
				--above "$intern" 

			poly_script -ex
			;;
		-b|both) 
			xrandr --output "$intern" --primary --auto \
				--output "$extern" --auto \
				--right-of "$intern"

			poly_script -int
			;;
		*) echo "Specify options. External (-e), Internal (-i), both (-b), both above (-a)" ;;
	esac
}

poly_script() {
	source $HOME/bin/launch_polybar.sh "$@"
}


main "$@"; 
