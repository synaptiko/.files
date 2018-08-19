#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s -f $1 $DIR/configs/source-rofi-config.rasi
$DIR/switch-rofi.js dark
rm -f $2
ln -s -f $DIR/configs/rofi-config.rasi $2
