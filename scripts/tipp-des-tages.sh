#!/bin/bash
. /etc/clientcustomizations/lib/log.sh

INPUT="/etc/clientcustomizations/data/tippdesTages.csv"
OLDIFS=$IFS
IFS=\;
images=()
texts=()
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read image txt
do
	images+=("$image")
	texts+=("$txt")
done < $INPUT
IFS=$OLDIFS
tipp=$(($RANDOM % ${#images[@]}))

notify-send  -t 10000 -i "/etc/clientcustomizations/data/images/${images[$tipp]}" "Tipp des Tages" "${texts[$tipp]}"

log "Tipp des Tages successfully executed"
