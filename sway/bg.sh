#!/usr/bin/env sh
KEEP_BG_PATH=/tmp/.sway-current-bg-$USER
if [ "$1" = "keep" ] && [ -f $KEEP_BG_PATH ]; then
	file=$(<$KEEP_BG_PATH)
	swaymsg "output * bg ~/Pictures/wallpapers/$file fill"
else
	ls ~/Pictures/wallpapers | sort -R | head -1 | while read file; do
		swaymsg "output * bg ~/Pictures/wallpapers/$file fill"
		echo $file > $KEEP_BG_PATH
	done
fi
