#!/usr/bin/env sh
ls ~/Pictures/wallpapers | sort -R | head -1 | while read file; do
	swaymsg "output * bg ~/Pictures/wallpapers/$file fill"
done
