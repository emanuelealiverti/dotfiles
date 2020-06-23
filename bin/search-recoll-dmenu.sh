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
LINE_MAX=15
#ROFI_HIST=/tmp/.rofi_hist
ROFI_HIST=${HOME}/.rofi_hist
# Use argument or query interactively.
if [ -z "$@" ]; then
	touch $ROFI_HIST
	#QUERY=`rofi -dmenu -p "Find:" -lines 10 -columns 1 -width 10 </dev/null`
	ll=$(cat $ROFI_HIST | wc -l)
	ll=$(( $ll < $LINE_MAX ? ll : $LINE_MAX ))
	QUERY=`cat $ROFI_HIST | head -n $ll | rofi -dmenu -p "Find:" -lines $ll -columns 1 -width 20`
	#paste on top if not empty
	if [ -n "$QUERY" ];  then
		sed -i "1s/^/$QUERY\n/" $ROFI_HIST
	fi
	#echo $QUERY >> $ROFI_HIST
else
	QUERY="$@"
fi

if [ ! -z "$QUERY" ]; then
	DOC=$($QUERY_TOOL "$QUERY" | grep 'file://' \
		| sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
		| perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
		| rofi -dmenu -p 'Results:' -i -width 50 -l 20)

	sed -i "1s/^/$QUERY\n/" $ROFI_HIST
	# delete duplicates
	gawk -i inplace '!seen[$0]++' $ROFI_HIST
fi

if [ "x$DOC" != x ]; then
	mimeopen "$HOME/$DOC"
fi
