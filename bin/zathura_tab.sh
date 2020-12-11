#!/bin/bash

xidfile="/run/user/"$(id -u)"/zathura-tabbed.xid"
wmclass="zathura-tabbed"

# check if a tabbed window is open
set -o pipefail
if [ -r "$xidfile" ] && xid=$(cat "$xidfile") && xprop -id "$xid" WM_CLASS 2> /dev/null | grep -q "$wmclass";
then
	wmctrl -i -R "$xid"
else
	# sometimes -c has some flaws
	read xid < <(tabbed -dn "$wmclass" -p -1 2> /dev/null)
	#read xid < <(tabbed -cdn "$wmclass" -p -1 2)
	#wmctrl -i -r "$xid" -b add,maximized_vert,maximized_horz
	wmctrl -i -r "$xid" -b add,maximized_vert
	echo "$xid" > "$xidfile"
fi

#check if a file is already opened
d=true
for i in $(pgrep zathura); do
	if [[ $@ = $(cat /proc/$i/cmdline | awk 'BEGIN {FS="\0"} {print $4}') ]]; then
		d=false
		break
	fi
done

if [ "$d" = true ]; 
then
	echo "open"
	#	zathura '--synctex-editor-command=/usr/bin/subl %{input}:%{line}' -e "$xid" "$@" &> /dev/null &
	zathura -e "$xid" "$@" &> /dev/null &
	echo "opened"
	#WINDOW_NAME="$(xdotool search --classname "zathura-tabbed" | tail -1)"
	#xseticon -id "$WINDOW_NAME" /home/meme/bin/ICONS/document-24-bl.png 
	#python2 /home/meme/bin/windowtool.py --decorations 0 "$xid"
fi
