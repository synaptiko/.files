#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CHROMIUM_CONFIG=~/.config/chromium-flags.conf
ln -s -f $DIR/config $CHROMIUM_CONFIG
