#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLUGINS_DIR=$DIR/plugins
GH_PREFIX=https://raw.githubusercontent.com

mkdir -p $PLUGINS_DIR

wget -O $PLUGINS_DIR/vi-mode.plugin.zsh \
	$GH_PREFIX/robbyrussell/oh-my-zsh/master/plugins/vi-mode/vi-mode.plugin.zsh
wget -O $PLUGINS_DIR/sudo.plugin.zsh \
	$GH_PREFIX/robbyrussell/oh-my-zsh/master/plugins/sudo/sudo.plugin.zsh
wget -O $PLUGINS_DIR/prompt_pure_setup \
	$GH_PREFIX/synaptiko/pure/master/pure.zsh
wget -O $PLUGINS_DIR/async \
	$GH_PREFIX/synaptiko/pure/master/async.zsh
