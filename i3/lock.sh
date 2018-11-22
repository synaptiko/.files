#!/usr/bin/env bash
revert() {
	xset s off -dpms
}

trap revert HUP INT TERM
xset dpms force off
i3lock -c 000000 -p default -n -u -t
revert
