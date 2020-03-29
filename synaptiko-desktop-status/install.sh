#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo systemctl --system daemon-reload

if ! sudo systemctl is-enabled synaptiko-desktop-status.socket >& /dev/null; then
	sudo systemctl enable synaptiko-desktop-status.socket
fi
if ! sudo systemctl is-active synaptiko-desktop-status.socket >& /dev/null; then
	sudo systemctl start synaptiko-desktop-status.socket
fi

BAR_CONFIG_DIR=~/.config/synaptiko-desktop-status
mkdir -p $BAR_CONFIG_DIR
BAR_CONFIG=$BAR_CONFIG_DIR/bar.config.js
ln -s -f $DIR/bar.config.js $BAR_CONFIG
