#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

POLYBAR_CONFIG_DIR=~/.config/polybar
mkdir -p $POLYBAR_CONFIG_DIR
POLYBAR_CONFIG=$POLYBAR_CONFIG_DIR/config
ln -s -f $DIR/polybar-config $POLYBAR_CONFIG
