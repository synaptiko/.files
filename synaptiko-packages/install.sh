#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/../.packages
cd $DIR/../.packages

if [ ! -d synaptiko-packages ]; then
	git clone https://github.com/synaptiko/packages.git synaptiko-packages
else
	cd synaptiko-packages
	git pull
fi

cd $DIR/../.packages/synaptiko-packages/synaptiko-desktop-status
makepkg --noconfirm -sircC
sudo systemctl --system daemon-reload
sudo systemctl enable synaptiko-desktop-status.socket
sudo systemctl start synaptiko-desktop-status.socket

cd $DIR/../.packages/synaptiko-packages/synaptiko-recent-dirs
makepkg --noconfirm -sircC

cd $DIR/../.packages/synaptiko-packages/synaptiko-ownvim
makepkg --noconfirm -sircC
systemctl --user daemon-reload
systemctl --user start synaptiko-ownvim.socket
sudo systemctl --global enable synaptiko-ownvim.socket
