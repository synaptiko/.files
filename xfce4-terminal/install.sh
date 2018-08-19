#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

XFCE4_TERMINAL_CONFIG_DIR=~/.config/xfce4/terminal
mkdir -p $XFCE4_TERMINAL_CONFIG_DIR
XFCE4_TERMINAL_CONFIG=$XFCE4_TERMINAL_CONFIG_DIR/terminalrc
$DIR/../0-theme/link-xfce4-terminal.sh $DIR/terminalrc $XFCE4_TERMINAL_CONFIG
