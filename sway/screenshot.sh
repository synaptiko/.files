#!/usr/bin/env bash

FILE=~/Pictures/Screenshot-$(date -Iseconds | cut -d'+' -f1).png

case "$1" in
	selection)
		windowGeometries=$(swaymsg -t get_tree \
			| jq -r '.. | (.nodes? // empty)[] | select(.pid and .visible) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
		)
		geometry=$(slurp -b "#45858820" -c "#45858880" -w 3 -d <<< "$windowGeometries") || exit $?
		grim -g "$geometry" $FILE
		;;
	screen) grim $FILE;;
esac

notify-desktop -u low -t 3000 "Screenshot has been taken" $(basename "$FILE")

xclip -selection clipboard -t image/png < $FILE
