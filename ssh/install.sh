#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SSH_CONFIG=~/.ssh/config
ln -s -f $DIR/config $SSH_CONFIG
