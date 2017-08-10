#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GIT_CONFIG=~/.gitconfig
ln -s -f $DIR/gitconfig $GIT_CONFIG
