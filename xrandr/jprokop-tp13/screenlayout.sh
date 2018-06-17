#!/usr/bin/env bash
if xrandr | grep "HDMI1 disconnected" >& /dev/null; then
	xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
else
	# Right & Left
	# xrandr --output HDMI1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
	# Top & Down
	xrandr --output HDMI1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output eDP1 --mode 1920x1080 --pos 320x1440 --rotate normal
fi
