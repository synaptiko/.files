#!/usr/bin/env bash

FILE=~/Pictures/Screenshot-$(date -Iseconds | cut -d'+' -f1).png

case "$1" in
	selection) maim -u -s -n -l -c 0.157,0.333,0.466,0.4 $FILE;;
	screen) maim -u -n $FILE;;
esac

xclip -selection clipboard -t image/png < $FILE
