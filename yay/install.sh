#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

YAY_CONFIG=~/.config/yay/config.json
mkdir -p $(dirname $YAY_CONFIG)
ln -s -f $DIR/config.json $YAY_CONFIG
