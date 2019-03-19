#!/usr/bin/env sh
if [ "$1" = "keep" ]; then
	file=$(</tmp/.sway-current-bg)
	swaymsg "output * bg ~/Pictures/wallpapers/$file fill"
else
	ls ~/Pictures/wallpapers | sort -R | head -1 | while read file; do
		swaymsg "output * bg ~/Pictures/wallpapers/$file fill"
		echo $file > /tmp/.sway-current-bg
	done
fi
