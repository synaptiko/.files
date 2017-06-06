#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.npm-packages

NPMRC_CONFIG=~/.npmrc
ln -s -f $DIR/npmrc $NPMRC_CONFIG
