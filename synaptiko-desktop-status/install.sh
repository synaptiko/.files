#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(pacman -T synaptiko-desktop-status | wc -l)" != "0" ]; then
	cd $DIR/../.packages

	if [ ! -d synaptiko-packages ]; then
		git clone https://github.com/synaptiko/packages.git synaptiko-packages
	fi

	cd synaptiko-packages/synaptiko-desktop-status
	git pull
	makepkg --noconfirm -sircC

	cd $DIR

	sudo systemctl --system daemon-reload
	sudo systemctl enable synaptiko-desktop-status.socket
	sudo systemctl start synaptiko-desktop-status.socket
fi
