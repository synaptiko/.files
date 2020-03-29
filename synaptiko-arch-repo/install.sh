#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! grep "\[synaptiko\]" /etc/pacman.conf >& /dev/null; then
	cat $DIR/repo | sudo tee -a /etc/pacman.conf > /dev/null
	yay -Sy
fi
