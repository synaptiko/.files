#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/../.packages

if [ ! -d synaptiko-packages ]; then
	git clone https://github.com/synaptiko/packages.git synaptiko-packages
else
	git pull
fi

if [ "$(pacman -T synaptiko-desktop-status | wc -l)" != "0" ]; then
	cd $DIR/../.packages/synaptiko-packages/synaptiko-desktop-status
	makepkg --noconfirm -sircC
	sudo systemctl --system daemon-reload
	sudo systemctl enable synaptiko-desktop-status.socket
	sudo systemctl start synaptiko-desktop-status.socket
fi

if [ "$(pacman -T synaptiko-recent-dirs | wc -l)" != "0" ]; then
	cd $DIR/../.packages/synaptiko-packages/synaptiko-recent-dirs
	makepkg --noconfirm -sircC
fi
