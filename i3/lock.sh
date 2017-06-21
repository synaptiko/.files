#!/usr/bin/env bash
revert() {
	xset s off -dpms
}

trap revert HUP INT TERM
xset dpms force off
i3lock -n -u -t -i ~/Pictures/i3lock.png
revert
