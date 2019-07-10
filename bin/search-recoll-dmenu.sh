#!/bin/bash
#
# edited to use with rofi, and check string
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Bind this to ctrl+space, while Super+space binds to rofi -show drun (to launch app)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Configuration
QUERY_TOOL="recoll -b -t"
#PROMPT_THEME='-nf #dcdcdc -nb #2f2 2f -sb #a6c292 -sf black'


# Use argument or query interactively.
if [ -z "$@" ]; then
	QUERY=`rofi -dmenu -p "Find:" -lines 0 -columns 1 -width 10 </dev/null`
else
	QUERY="$@"
fi

if [ ! -z "$QUERY" ]; then
DOC=$($QUERY_TOOL "$QUERY" | grep 'file://' \
	| sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
	| perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
	| rofi -dmenu -p 'Results:' -i -width 50 -l 20)
fi

if [ "x$DOC" != x ]; then
	xdg-open "$HOME/$DOC"
fi
