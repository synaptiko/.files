#!/usr/bin/env bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

HOSTNAME=`hostname`

if [[ "$HOSTNAME" == "jprokop-tp13" ]]; then
	if xrandr | grep "HDMI1 connected" >& /dev/null; then
		MONITOR=HDMI1 polybar main-$HOSTNAME >& /dev/null &
		MONITOR=eDP1 polybar left-$HOSTNAME >& /dev/null &
	else
		MONITOR=eDP1 polybar main-$HOSTNAME >& /dev/null &
	fi
else
	polybar main-$HOSTNAME >& /dev/null &
fi
