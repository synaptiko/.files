#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MOC_CONFIG_DIR=~/.moc
mkdir -p $MOC_CONFIG_DIR
MOC_CONFIG=$MOC_CONFIG_DIR/config
ln -s -f $DIR/config $MOC_CONFIG
THEME_DIR=$MOC_CONFIG_DIR/themes
mkdir -p $THEME_DIR
THEME_FILE=$THEME_DIR/jprokop_theme
ln -s -f $DIR/jprokop_theme $THEME_FILE

# downloaded from https://moc.daper.net/contrib and http://ftp.daper.net/pub/soft/moc/contrib/eqsets.tar.gz
EQSETS_DIR=$MOC_CONFIG_DIR/eqsets
ln -s -f $DIR/eqsets $EQSETS_DIR
