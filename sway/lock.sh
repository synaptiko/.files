#!/usr/bin/env sh
if ! pgrep -u $UID ^swaylock$; then
	swaymsg mode locked \
		&& swaymsg workspace 0 \
		&& swaylock -s center -i ~/.files/sway/lock.png \
		&& swaymsg workspace 0 \
		&& swaymsg mode default
fi
