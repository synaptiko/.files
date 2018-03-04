#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$USER" == "root" ]; then
	mkdir -p ~/.files
	ln -s -f $DIR ~/.files
else
	sudo ln -s -f $DIR/reflector.service /etc/systemd/system/reflector.service
	sudo mkdir -p /etc/pacman.d/hooks
	sudo ln -s -f $DIR/pacman-mirrorlist-upgrade.hook /etc/pacman.d/hooks/pacman-mirrorlist-upgrade.hook
fi

ZSHRC_CONFIG=~/.zshrc
ln -s -f $DIR/zshrc $ZSHRC_CONFIG

ZSH_PLUG_DIR=~/.zsh_plug
ln -s -f $DIR/plugins $ZSH_PLUG_DIR

# to support aliases inside of vim (:!gs for example)
ZSHENV_CONFIG=~/.zshenv
ln -s -f $DIR/zshenv $ZSHENV_CONFIG
