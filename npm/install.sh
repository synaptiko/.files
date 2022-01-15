#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NPMRC_CONFIG=~/.npmrc
ln -s -f $DIR/npmrc $NPMRC_CONFIG
