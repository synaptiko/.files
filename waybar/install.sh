#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WAYBAR_CONFIG_DIR=~/.config/waybar
mkdir -p $WAYBAR_CONFIG_DIR
WAYBAR_CONFIG=$WAYBAR_CONFIG_DIR/config
ln -s -f $DIR/config $WAYBAR_CONFIG

WAYBAR_STYLE=$WAYBAR_CONFIG_DIR/style.css
ln -s -f $DIR/style.css $WAYBAR_STYLE

# TODO jprokop: for later:
#
# https://github.com/Alexays/Waybar/wiki/FAQ#how-can-i-temporarily-hide-the-bars
# > killall -SIGUSR1 waybar
#
# https://github.com/Alexays/Waybar/wiki/FAQ#how-can-i-reload-the-configuration-without-restarting-waybar
# > killall -SIGUSR2 waybar
