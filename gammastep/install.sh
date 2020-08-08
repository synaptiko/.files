#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GAMMASTEP_CONFIG=~/.config/gammastep/config.ini
mkdir -p $(dirname $GAMMASTEP_CONFIG)
ln -s -f $DIR/config.ini $GAMMASTEP_CONFIG
