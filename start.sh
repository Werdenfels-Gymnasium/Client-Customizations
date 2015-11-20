#!/bin/bash

notify-send -t 0 "start.sh wird ausgeführt"
for script in /etc/anmeldescripte/scripts/*
do
	sh $script &
	echo "Executing $script" >> /tmp/tipp.log
done
echo "startsh ausgeführt" >> /tmp/tipp.log
