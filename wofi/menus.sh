#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "generate-cache" ]; then
	chromium-runner --generate-cache
elif [ "$1" == "programs" ]; then
	wofi --show=drun --width=400 --lines=5
elif [ "$1" == "browsers" ]; then
	echo > ~/.cache/wofi-browsers
	LINES=`chromium-runner-rofi | wc -l`
	ITEM=`chromium-runner-rofi | wofi --cache-file=~/.cache/wofi-browsers --dmenu --width=200 --lines=$LINES`
	if [ $? == 0 ]; then
		chromium-runner-rofi $ITEM
	fi
elif [ "$1" == "tasks" ]; then
	echo > ~/.cache/wofi-tasks
	LINES=`~/Documents/todo/track-rofi.sh | wc -l`
	ITEM=`~/Documents/todo/track-rofi.sh | wofi --cache-file=~/.cache/wofi-tasks --dmenu --width=200 --lines=$LINES`
	if [ $? == 0 ]; then
		~/Documents/todo/track-rofi.sh $ITEM
	fi
elif [ "$1" == "close" ]; then
	pkill wofi
fi
