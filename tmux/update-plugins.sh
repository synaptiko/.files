#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLUGINS_DIR=$DIR/plugins
GH_PREFIX=https://raw.githubusercontent.com

mkdir -p $PLUGINS_DIR/extrakto/scripts

wget -O $PLUGINS_DIR/extrakto/extrakto.tmux \
	$GH_PREFIX/laktak/extrakto/master/extrakto.tmux
chmod u+x $PLUGINS_DIR/extrakto/extrakto.tmux
wget -O $PLUGINS_DIR/extrakto/extrakto.py \
	$GH_PREFIX/laktak/extrakto/master/extrakto.py
chmod u+x $PLUGINS_DIR/extrakto/extrakto.py
wget -O $PLUGINS_DIR/extrakto/scripts/helpers.sh \
	$GH_PREFIX/laktak/extrakto/master/scripts/helpers.sh
chmod u+x $PLUGINS_DIR/extrakto/scripts/helpers.sh
wget -O $PLUGINS_DIR/extrakto/scripts/tmux-extrakto.sh \
	$GH_PREFIX/laktak/extrakto/master/scripts/tmux-extrakto.sh
chmod u+x $PLUGINS_DIR/extrakto/scripts/tmux-extrakto.sh
