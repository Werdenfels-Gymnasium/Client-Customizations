#!/bin/bash
. /etc/clientcustomizations/lib/log.sh

for script in /etc/clientcustomizations/scripts/*
do
  log "Try to execute $script"
  sh $script &
done
