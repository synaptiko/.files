#!/usr/bin/env bash

FILE=~/Pictures/Screenshot-$(date -Iseconds | cut -d'+' -f1).png

case "$1" in
	selection)
		windowGeometries=$(swaymsg -t get_tree \
			| jq -r 'recurse(.nodes[]?, .floating_nodes[]?) | select(.visible or (.type == "output" and .active)) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
		)
		geometry=$(slurp -b "#45858820" -c "#45858880" -w 3 -d <<< "$windowGeometries") || exit $?
		grim -g "$geometry" $FILE
		;;
	screen)
		focusedOutput=$(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused) | .name')
		grim -o $focusedOutput $FILE
		;;
esac

notify-desktop -u low -t 3000 "Screenshot has been taken" $(basename "$FILE")

xclip -selection clipboard -t image/png < $FILE
