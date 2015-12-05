#!/bin/bash
. /etc/clientcustomizations/lib/log.sh

# Specify Show Time in Seconds
showtime=10
user=$1
quota="300MB"

notify-send -t $(($showtime*1000)) "User Quota" "$1 sie haben noch $quota Festplattenspeicher zur Verfügung"

log "Show Quota successfully executed"