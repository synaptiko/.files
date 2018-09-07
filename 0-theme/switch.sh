#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ACTIVE_THEME_FILE=$DIR/configs/active-theme

if [[ "$1" == "toggle" ]]; then
	if [ -e $ACTIVE_THEME_FILE ]; then
		theme=`cat $ACTIVE_THEME_FILE`
	else
		theme=dark
	fi

	# toggle the theme
	if [[ "$theme" == "light" ]]; then
		theme=dark
	else
		theme=light
	fi
else
	theme=${1:-dark}
fi

echo -n $theme > $ACTIVE_THEME_FILE

$DIR/switch-alacritty.js $theme &
$DIR/switch-nvim.sh $theme &
$DIR/switch-rofi.js $theme &

# This is ugly way how to overcome the inability of xfce4-terminal to detect changes in the symlinked file
$DIR/switch-xfce4-terminal.js $theme && sleep 0.1 && cp $DIR/configs/xfce4-terminal-terminalrc `ls -l ~/.files/0-theme/configs/link-to-xfce4-terminal-terminalrc | sed -e 's/.\+-> //'` &
