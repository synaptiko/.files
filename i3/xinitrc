#!/usr/bin/env bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

XRANDR_DIR=$HOME/.files/xrandr
HOSTNAME=`hostname`

if [ -f $XRANDR_DIR/$HOSTNAME/screenlayout.sh ]; then
	$XRANDR_DIR/$HOSTNAME/screenlayout.sh
fi

# bell sound off
xset b off
# screensaver: on, blank and after 5 minutes
xset s on
xset s blank
xset s 300 300

numlockx &
xbanish &

export QT_QPA_PLATFORMTHEME="qt5ct"

~/.files/i3/merge-config.sh
exec i3
