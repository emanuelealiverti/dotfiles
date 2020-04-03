#!/bin/bash
intern=eDP1
extern=HDMI1

main() {
	case "$1" in
		-e|external) xrandr --output "$intern" --off --output "$extern" --auto ;;
		-i|internal)  xrandr --output "$extern" --off --output "$intern" --auto ;;
		-b|both) xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --auto ;;
		*) echo "Specify options. External (e), Internal, both (b)" ;;
	esac
}

main "$@"
