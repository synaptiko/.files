#!/usr/bin/env bash
if xrandr | grep "HDMI1 disconnected" >& /dev/null; then
	xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
else
	xrandr --output HDMI1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
fi
