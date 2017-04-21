#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

XFCE4_TERMINAL_CONFIG_DIR=~/.config/xfce4/terminal
mkdir -p $XFCE4_TERMINAL_CONFIG_DIR
XFCE4_TERMINAL_CONFIG=$XFCE4_TERMINAL_CONFIG_DIR/terminalrc
ln -s -f $DIR/terminalrc-dark $XFCE4_TERMINAL_CONFIG
