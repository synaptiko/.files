#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WOFI_CONFIG=~/.config/wofi/config
mkdir -p $(dirname $WOFI_CONFIG)
ln -s -f $DIR/config $WOFI_CONFIG

WOFI_STYLE=~/.config/wofi/style.css
mkdir -p $(dirname $WOFI_STYLE)
ln -s -f $DIR/style.css $WOFI_STYLE

WOFI_COLORS=~/.config/wofi/colors
mkdir -p $(dirname $WOFI_COLORS)
ln -s -f $DIR/colors $WOFI_COLORS
