#!/bin/bash
fold=$2
if [ -z "$2" ]
 then fold=*
else fold=$fold/*
fi

if [[ "$1" == "s" || "$1" == "-s" ]]; then 
	du $fold -csh | sort -rh;
else
	du $fold -csh;
fi

