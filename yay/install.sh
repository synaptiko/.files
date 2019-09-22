#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(pacman -T yay | wc -l)" != "0" ]; then
	echo "Yay is required; it will be installed now"

	mkdir -p $DIR/../.packages
	cd $DIR/../.packages
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -sircC

	cd $DIR
fi

if ! id yay >& /dev/null; then
	echo "Creating yay user and group"
	sudo groupadd yay
	sudo useradd -m -g yay -s /usr/bin/zsh yay
	sudo gpasswd -a yay users
	sudo gpasswd -a yay network
	sudo gpasswd -a yay storage

	echo "Set password for yay user:"
	sudo passwd yay
fi

if ! sudo ls /etc/sudoers.d/10-yay >& /dev/null; then
	echo "Creating sudoers file for yay user"
	echo "yay ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/10-yay >& /dev/null
fi

# TODO jprokop: make it more generic/universal
if ! sudo grep "(yay)" /etc/sudoers.d/10-eggze >& /dev/null; then
	echo "eggze ALL=(yay) NOPASSWD: ALL" | sudo tee --append /etc/sudoers.d/10-eggze >& /dev/null
fi

if ! sudo grep "(yay)" /etc/sudoers.d/10-jprokop >& /dev/null; then
	echo "jprokop ALL=(yay) NOPASSWD: ALL" | sudo tee --append /etc/sudoers.d/10-jprokop >& /dev/null
fi

# TODO jprokop: improve later (once proper multiuser support is in place)
YAY_CONFIG=/home/yay/.config/yay/config.json
sudo -u yay mkdir -p $(dirname $YAY_CONFIG)
# TODO jprokop: ln -s -f cannot be used here which would be ideal… figure out later
sudo cp $DIR/config.json $YAY_CONFIG
sudo chown -h yay:yay $YAY_CONFIG
