#!/bin/bash

#function to sort mp3 files by artists
function sort_by_artist {
	path="."
	for song in *.mp3
	do
		astring=$(id3info "$song" | grep -i performer)
		artist="${astring##*:}"
		mkdir -p "$path/$artist"
		cp $song "$path/$artist"
		echo $artist
	done

}

#function to sort mp3files by year
function sort_by_year {
	path="."
        for song in *.mp3
        do
                astring=$(id3info "$song" | grep -i year)
                year="${astring##*:}"
                mkdir -p "$path/$year"
                cp $song "$path/$year"
                echo $year
        done

}

#help function
function help_function {
	echo "[!] Run in Target Directory"
	echo
	echo "Mp3 Utility for Linux"
	echo 
	echo "usage: bash sortmusic.sh [ -a |-y |-h ]"
	echo
	echo "-a, --artists | Sort Mp3 Files By Artists Name"
	echo "-y, --year    | Sort Mp3 Files By Year"
	echo "-h, --help    | Display Help Message"
	echo 
}

#commandline argument
arg=$1

#condtions on the basis of arguements given
if [[ "$1" == "-a" || "$1" == "--artist" ]];
then
	echo "[!] Sorting Mp3 By Artists "
	sleep 3
	sort_by_artist

elif [[ "$1" == "-y" || "$1" == "--year" ]];
then
	echo "[!] Sorting Mp3 Files By Year"
	sleep 3
	sort_by_year

elif [[ "$1" == "-h" || "$1" == "--help" ]];
then
	sleep 1
	help_function
else
	echo "[!] Invalid Arguement"
	sleep 2 && clear
	help_function
fi
