#!/bin/bash

notify-send -t 0 -i /etc/anmeldescripte/wg.png "Tipp des Tages" "Durch Drücken auf das WG-Hilfe-Symbol kommst du zu den Hilfe-Seiten unseres Systems mit vielen nützlichen Tipps."

date >> /tmp/anmeldescripte.log
echo "tipp-des-tages.sh ausgeführt" >> /tmp/anmeldescripte.log

