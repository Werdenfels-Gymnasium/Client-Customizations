#!/bin/bash
. /etc/clientcustomizations/lib/log.sh

theUser="$(whoami)"
groups="$(id)"
groups1="${groups##*gid=}"
groups2="${groups1#*(}"
group="${groups2%%)*}"
used=0
max=0

if [ "$group" == "teachers" ]
then
	used=$(cat "/home/teachers/${theUser}/Home_auf_Server/.userQuota" | awk '{print int($1)}')
	max=$(cat "/home/teachers/${theUser}/Home_auf_Server/.userQuota" | awk '{print int($2)}')
else
	used=$(cat "/home/students/${group}/${theUser}/Home_auf_Server/.userQuota" | awk '{print int($1)}')
	max=$(cat "/home/students/${group}/${theUser}/Home_auf_Server/.userQuota" | awk '{print int($2)}')
fi
userQuota=$(awk "BEGIN {printf \"%.1f\n\", ${used}/${max}}")
userQuotaAsPercent=$(awk "BEGIN {printf \"%.1f\n\", ${used}/${max}*100}")
if [[ $userQuota > 0.80 ]]
then
	notify-send -t 0 -i "/usr/share/icons/gnome/256x256/status/dialog-warning.png" "Achtung!" "Sie haben schon ${userQuotaAsPercent}% ihres Speicherplatzes belegt!"
else
	notify-send -t 10000 -i "/usr/share/icons/gnome/256x256/devices/usbpendrive_unmount.png" "Sie haben ${userQuotaAsPercent}% ihres Speicherplatzes belegt!"
fi
log "Showed Quota, ${userQuota}% on User ${theUser}"
