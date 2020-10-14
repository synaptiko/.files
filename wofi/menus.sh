#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "generate-cache" ]; then
	synaptiko-browser-profile-runner --generate-cache
elif [ "$1" == "programs" ]; then
	wofi --show=drun --width=400 --lines=5
elif [ "$1" == "browsers" ]; then
	rm -f ~/.cache/wofi-browsers
	LINES=`synaptiko-browser-profile-runner-rofi | wc -l`
	ITEM=`synaptiko-browser-profile-runner-rofi | wofi --cache-file=$HOME/.cache/wofi-browsers --dmenu --width=200 --lines=$LINES`
	if [ $? == 0 ]; then
		synaptiko-browser-profile-runner-rofi "$ITEM"
	fi
elif [ "$1" == "tasks" ]; then
	rm -f ~/.cache/wofi-tasks
	LINES=`~/Documents/time-track-utils/track-rofi.sh | wc -l`
	ITEM=`~/Documents/time-track-utils/track-rofi.sh | wofi --cache-file=$HOME/.cache/wofi-tasks --dmenu --width=200 --lines=$LINES`
	if [ $? == 0 ]; then
		~/Documents/time-track-utils/track-rofi.sh "$ITEM"
	fi
elif [ "$1" == "close" ]; then
	pkill wofi
fi
