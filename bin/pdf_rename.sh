#!/bin/bash
count=1;
#regex="^[[]0-9{}()]+$"
regex="([0-9])+"
regex2="([()?/]+)"
words="(Printed|preprint|arXiv|content|Contents|journal|Journal|Rejoinder|Science|Annals|Communication)"

rename() {
	for f in "$@"; do 
		mv "$f" "${f//et al./etal}";
		mv "$f" "${f//,/}";
		mv "$f" "${f// - /_}";
		mv "$f" "${f// /_}";
		mv "$f" "${f//:/}";
	done
}

if [ $# -eq 0 ]
then
	echo "No arguments supplied"
	exit 1
fi

mkdir OLD_NAMES
echo "check OLD_NAMES to see old papers"
cp "$@" OLD_NAMES/
mkdir OLD_NAMES/tmp
cp "$@" OLD_NAMES/tmp
rm "$@"
cd OLD_NAMES/tmp
rename *
echo "renaming"
for f in *.pdf; do
	title=$(pdfinfo "$f" | grep Title: | sed 's/Title:[ ]*//');
	if [[ $title =~ $regex ]] || [[ $title =~ $regex2 ]] || [[ $title =~ $words ]] || [[ -z $title ]];
	then
		id=1
		while [[ $title =~ $regex ]] || [[ $title =~ $regex2 ]] || [[ $title =~ $words ]] || [[ -z $title ]];
		do
			title=$(pdftotext "$f" - | sed  -n "$id"p)
			((id++))
		done
		echo $title
		if [[ $title =~ $regex ]];
		then
			title=$count
			((count++))
		fi
	fi
	mv "$f" "../../$title".pdf  
	echo "Final title:"$title
done
cd ../../
rename *
rm -rf OLD_NAMES/tmp
