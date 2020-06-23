#!/bin/bash

fan=$(sensors | grep 'Video Fan' | cut -c15-19)


pr=$(sensors | grep 'Processor Fan' | cut -c15-19)

#temp=$(sensors | grep 'Pack' | cut -c17-20)
temp=$(sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " | sed 's/ /°C  /g' | sed 's/  $//')

tn=$(sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " | sort -nr)
echo $tn
echo $tn[1]
if [[ $((fan +0)) == 0 ]]; then 
	echo '' $temp
else
	echo '' $temp '' $fan $pr
fi

