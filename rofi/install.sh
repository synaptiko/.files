#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ROFI_CONFIG=~/.config/rofi/config.rasi
mkdir -p $(dirname $ROFI_CONFIG)
$DIR/../0-theme/link-rofi.sh $DIR/config.rasi $ROFI_CONFIG
