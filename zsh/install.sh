#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ZPLUG_DIR=~/.zplug
if [ ! -d $ZPLUG_DIR ]; then
	git clone https://github.com/zplug/zplug $ZPLUG_DIR
	touch ~/.zsh-first-run
fi

ZSHRC_CONFIG=~/.zshrc
ln -s -f $DIR/zshrc $ZSHRC_CONFIG

sudo ln -s -f $DIR/reflector.service /etc/systemd/system/reflector.service

if [ "$USER" == "root" ]; then
	mkdir -p ~/.files
	ln -s -f $DIR ~/.files
fi
