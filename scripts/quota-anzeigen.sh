#!/bin/bash
user=$1
quota="300MB"

notify-send -t 1 "User Quota" "$1 sie haben noch $quota Festplattenspeicher zur Verfügung"

date >> /tmp/anmeldescripte.log
echo "quota-anzeigen.sh ausgeführt" >> /tmp/anmeldescripte.log
