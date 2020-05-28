#!/usr/bin/env bash
windowGeometries=$(
	swaymsg -t get_workspaces -r | jq -r '.[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'; \
	swaymsg -t get_outputs -r | jq -r '.[] | select(.active) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
)
geometry=$(slurp -b "#45858820" -c "#45858880" -w 3 -d <<< "$windowGeometries") || exit $?
echo $geometry
