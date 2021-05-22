#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LAZYGIT_CONFIG=~/.config/lazygit/config.yml
mkdir -p $(dirname $LAZYGIT_CONFIG)
ln -s -f $DIR/config.yml $LAZYGIT_CONFIG
