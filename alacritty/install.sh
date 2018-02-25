#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ALACRITTY_CONFIG=~/.config/alacritty/alacritty.yml
mkdir -p $(dirname $ALACRITTY_CONFIG)
ln -s -f $DIR/alacritty.yml $ALACRITTY_CONFIG
