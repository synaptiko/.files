#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REDSHIFT_CONFIG=~/.config/redshift.conf
ln -s -f $DIR/redshift.conf $REDSHIFT_CONFIG
