#!/bin/bash

fan=$(sensors | grep 'Video Fan' | cut -c15-19)


pr=$(sensors | grep 'Processor Fan' | cut -c15-19)

temp=$(sensors | grep 'Pack' | cut -c17-20)


if [[ $fan == '   0' ]]; then 
	echo '' $temp
else
	echo '' $temp '' $fan $pr
fi

