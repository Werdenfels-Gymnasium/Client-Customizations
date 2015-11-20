#!/bin/bash

for script in /etc/anmeldescripte/scripts/*
do
	sh $script &
done
