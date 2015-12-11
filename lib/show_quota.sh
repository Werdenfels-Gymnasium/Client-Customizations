#!/bin/bash
. /etc/clientcustomizations/lib/log.sh

user="$(whoami)"
groups="$(id)"
groups1="${gruppen##*gid=}"
groups2="${gruppen1#*(}"
group="${gruppen2%%)*}"
used=0
max=0

if [ "$group" == "teachers" ]
then
	used=$(cat "/home/teachers/${user}/Home_auf_Server/.userQuota" | awk '{print int($1)}')
	max=$(cat "/home/teachers/${user}/Home_auf_Server/.userQuota" | awk '{print int($2)}')
else
	used=$(cat "/home/students/${group}/${user}/Home_auf_Server/.userQuota" | awk '{print int($1)}')
	max=$(cat "/home/students/${group}/${user}/Home_auf_Server/.userQuota" | awk '{print int($2)}')
fi
userQuota=$(awk "BEGIN {printf \"%.1f\n\", ${used}/${max}*100}")
if [[ $userQuota > 80 ]]
then
	notify-send -t 0 -i "/usr/share/icons/gnome/256x256/status/dialog-warning.png" "Achtung!" "Sie haben schon ${userQuota}% ihres Speicherplatzes belegt!"
else
	notify-send -t 10000 -i "/usr/share/icons/gnome/256x256/devices/usbpendrive_unmount.png" "Sie haben ${userQuota}% ihres Speicherplatzes belegt!"
fi
log "Showed Quota, ${userQuota}% on User ${user}"