#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CHROMIUM_CONFIG=~/.config/chromium-flags.conf
ln -s -f $DIR/config $CHROMIUM_CONFIG

CHROME_CONFIG=~/.config/chrome-flags.conf
ln -s -f $DIR/config $CHROME_CONFIG

ELECTRON_FLAGS_CONFIG=~/.config/electron-flags.conf
ln -s -f $DIR/config $ELECTRON_FLAGS_CONFIG
