#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ZLOGIN_CONFIG=~/.zlogin
ln -s -f $DIR/zlogin $ZLOGIN_CONFIG
