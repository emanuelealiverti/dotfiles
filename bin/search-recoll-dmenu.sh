#!/bin/bash
#
# edited to use with rofi, and check string
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Bind this to ctrl+space, while Super+space binds to rofi -show drun (to launch app)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Update: add history (very naive implementation)
#
# Configuration
QUERY_TOOL="recoll -b -t"
#PROMPT_THEME='-nf #dcdcdc -nb #2f2 2f -sb #a6c292 -sf black'
LINE_MAX=10

# Use argument or query interactively.
if [ -z "$@" ]; then
	touch /tmp/rofi.hist
	#QUERY=`rofi -dmenu -p "Find:" -lines 10 -columns 1 -width 10 </dev/null`
	ll=$(cat /tmp/rofi.hist | wc -l)
	ll=$(( $ll < $LINE_MAX ? ll : $LINE_MAX ))
	QUERY=`tac /tmp/rofi.hist | head -n $ll | rofi -dmenu -p "Find:" -lines $ll -columns 1 -width 20`
else
	QUERY="$@"
fi

if [ ! -z "$QUERY" ]; then
	echo $QUERY >> /tmp/rofi.hist
	gawk -i inplace '!seen[$0]++' /tmp/rofi.hist
DOC=$($QUERY_TOOL "$QUERY" | grep 'file://' \
	| sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
	| perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
	| rofi -dmenu -p 'Results:' -i -width 50 -l 20)
fi

if [ "x$DOC" != x ]; then
	xdg-open "$HOME/$DOC"
fi
