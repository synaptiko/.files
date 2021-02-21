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

xclip -selection clipboard -t image/png < $FILE

ANNOTATE=`dunstify -b -u low -t 15000 "Screenshot has been taken (click to annotate)" $(basename "$FILE")`

if [ $ANNOTATE == 2 ]; then
	swappy -f $FILE
fi

# TODO: I could use notification actions + makoctl + wofi to show actions to do after the screenshot is taken, ie.:
# - Dismiss
# - Annotate
# - Save to file
# - Open in Gimp
# - Upload and copy URL
#
# Some snippets:
# dunstify -A yes,"Save to file" -A no,"Annotate" "Test"
# makoctl menu wofi --dmenu
