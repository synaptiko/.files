#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

KANSHI_CONFIG_DIR=~/.config/kanshi
mkdir -p $KANSHI_CONFIG_DIR
KANSHI_CONFIG=$KANSHI_CONFIG_DIR/config
ln -s -f $DIR/config $KANSHI_CONFIG
