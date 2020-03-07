#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WOFI_CONFIG=~/.config/wofi/config
mkdir -p $(dirname $WOFI_CONFIG)
ln -s -f $DIR/config $WOFI_CONFIG

WOFI_STYLE=~/.config/wofi/style.css
mkdir -p $(dirname $WOFI_STYLE)
ln -s -f $DIR/style.css $WOFI_STYLE

$DIR/../0-theme/switch-wofi.js `$DIR/../0-theme/get-theme.sh`
