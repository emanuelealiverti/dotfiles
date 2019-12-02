#!/bin/bash

if [[ "$1" == "merge" || "$1" == "-m" ]]; then 
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=MERGED.pdf "${@:2}"

elif [[ "$1" == "split" || "$1" == "-s" ]]; then
gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
   -dFirstPage=${2} \
   -dLastPage=${3} \
   -sOutputFile=${4%.pdf}_p${2}-p${3}.pdf \
   ${4}

else
	echo $'Usage:
	pdf_page.sh -m FILE1.pdf FILE2.pdf >> MERGE
	pdf_page.sh -s page1 page2 >> splitted'
fi

