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
