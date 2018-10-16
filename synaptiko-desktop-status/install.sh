#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BAR_CONFIG_DIR=~/.config/synaptiko-desktop-status
mkdir -p $BAR_CONFIG_DIR
BAR_CONFIG=$BAR_CONFIG_DIR/bar.config.js
ln -s -f $DIR/bar.config.js $BAR_CONFIG
