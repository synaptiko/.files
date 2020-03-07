#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ACTIVE_THEME_FILE=$DIR/configs/active-theme

if [ -e $ACTIVE_THEME_FILE ]; then
	theme=`cat $ACTIVE_THEME_FILE`
else
	theme=dark
fi

echo $theme
