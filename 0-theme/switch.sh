#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/switch-alacritty.js $1 &
$DIR/switch-nvim.sh $1 &

# This is ugly way how to overcome the inability of xfce4-terminal to detect changes in the symlinked file
$DIR/switch-xfce4-terminal.js $1 && cp $DIR/configs/xfce4-terminal-terminalrc `ls -l ~/.files/0-theme/configs/link-to-xfce4-terminal-terminalrc | sed -e 's/.\+-> //'` &
