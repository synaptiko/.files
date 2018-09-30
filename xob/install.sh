#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

XOB_CONFIG_DIR=~/.config/xob
mkdir -p $XOB_CONFIG_DIR
XOB_CONFIG=$XOB_CONFIG_DIR/styles.cfg
ln -s -f $DIR/styles.cfg $XOB_CONFIG
